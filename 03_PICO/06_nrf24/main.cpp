/*
  RadioLib nRF24L01+ Raspberry Pi Pico library example

  This example demonstrates how to transmit data using nRF24L01+ module.
  It sends packets with incrementing counter every second.
  Includes proper USB CDC initialization delay for printf output.
*/

// define pins to be used
#define SPI_PORT spi0
#define SPI_MISO 4
#define SPI_MOSI 3
#define SPI_SCK 2

// nRF24L01+ connections (no reset pin needed)
#define RFM_NSS 26    // CS pin (Chip Select)
#define RFM_CE 15     // CE pin (Chip Enable)
#define RFM_IRQ 14    // IRQ pin (Interrupt Request) - optional but recommended

#include <pico/stdlib.h>
#include <string>

// include the library
#include <RadioLib.h>

// include the hardware abstraction layer
#include "hal/RPiPico/PicoHal.h"

// create a new instance of the HAL class
PicoHal* hal = new PicoHal(SPI_PORT, SPI_MISO, SPI_MOSI, SPI_SCK);

// create Module instance first (CS, IRQ, CE)
Module mod(hal, RFM_NSS, RFM_IRQ, RFM_CE);

// now create the nRF24 radio module
nRF24 radio = &mod;

// transmit address
uint8_t addr[] = {0x01, 0x23, 0x45, 0x67, 0x89};

// Helper function to print messages
void print_message(const char* prefix, const char* message) {
    printf("[%s] %s\n", prefix, message);
}

void print_error(const char* prefix, int code) {
    printf("[%s] failed, code %d\n", prefix, code);
}

int main() {
    // Initialize USB CDC (virtual serial port)
    stdio_init_all();
    
    // IMPORTANT: Wait for USB to be ready before using printf
    // This is crucial for printf to work properly
    sleep_ms(3000);  // 3 second delay to ensure USB CDC is ready
    
    print_message("nRF24", "Starting nRF24L01+ transmitter...");
    print_message("SYS", "USB CDC initialized");
    gpio_init(25);
    gpio_set_dir(25,GPIO_OUT);
    gpio_init(6);
    gpio_set_dir(6,GPIO_IN);
    gpio_pull_up(6);

    int i =10;
    while(i--)
    {
      gpio_put(25,0);
      sleep_ms(500);
      gpio_put(25,1);
      sleep_ms(500);
    }

    while (1)
    {
      /* code */
      if(gpio_get(6)==0)
      {
        gpio_put(25,0);
      sleep_ms(500);
      gpio_put(25,1);
      sleep_ms(500);
      }
    }
    
  // configure nRF24
  print_message("nRF24", "Initializing radio...");
  ConfigFSK_t config;
  config.frequency = 2400;  // 2.4 GHz
  int state = radio.begin(config);
  if (state != RADIOLIB_ERR_NONE) {
    print_error("nRF24", state);
    return(1);
  }
  print_message("nRF24", "Radio initialized successfully!");

  // set transmit address
  print_message("nRF24", "Setting transmit pipe...");
  state = radio.setTransmitPipe(addr);
  if (state != RADIOLIB_ERR_NONE) {
    print_error("nRF24", state);
    return(1);
  }
  print_message("nRF24", "Transmit pipe configured!");

  print_message("nRF24", "Starting transmission loop...");
  print_message("nRF24", "You should see messages every second");

  // loop forever
  int count = 0;
  for(;;) {
    // send a packet
    print_message("nRF24", "Transmitting packet...");
    
    // you can transmit C-string up to 32 characters long
    char str[32];
    snprintf(str, sizeof(str), "Hello World! #%d", count++);
    int state = radio.transmit(str);

    if(state == RADIOLIB_ERR_NONE) {
      // the packet was successfully transmitted
      print_message("nRF24", "Success!");

    } else if (state == RADIOLIB_ERR_PACKET_TOO_LONG) {
      print_message("nRF24", "Too long!");
      
    } else if (state == RADIOLIB_ERR_ACK_NOT_RECEIVED) {
      print_message("nRF24", "ACK not received!");
      
    } else if (state == RADIOLIB_ERR_TX_TIMEOUT) {
      print_message("nRF24", "Timeout!");
      
    } else {
      print_error("nRF24", state);
    }

    // wait for a second before transmitting again
    hal->delay(1000);

  }

  return(0);
}
