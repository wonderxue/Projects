/*
  RadioLib nRF24L01+ Raspberry Pi Pico - Receiver Example

  This example demonstrates how to receive data using nRF24L01+ module.
  It listens for packets and prints received data.
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

// receive address (must match transmitter's address)
uint8_t addr[] = {0x01, 0x23, 0x45, 0x67, 0x89};

// received data buffer
uint8_t str[32];

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
    
    print_message("nRF24", "Starting nRF24L01+ receiver...");
    print_message("SYS", "USB CDC initialized");
  
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

  // set receive address
  print_message("nRF24", "Setting receive pipe...");
  state = radio.setReceivePipe(0, addr);
  if (state != RADIOLIB_ERR_NONE) {
    print_error("nRF24", state);
    return(1);
  }
  print_message("nRF24", "Receive pipe configured!");

  // start listening for packets
  print_message("nRF24", "Starting to listen...");
  state = radio.startReceive();
  if (state != RADIOLIB_ERR_NONE) {
    print_error("nRF24", state);
    return(1);
  }
  print_message("nRF24", "Listening for packets...");

  print_message("nRF24", "Waiting for transmission...");

  // loop forever
  for(;;) {
    // check if new packet is received
    if(radio.available()) {
      print_message("nRF24", "Received packet:");
      
      // read the packet
      int state = radio.receive(str, sizeof(str));
      
      if(state == RADIOLIB_ERR_NONE) {
        // packet was successfully received
        printf("  Data: '%s'\n", str);
        
      } else {
        // some error occurred
        print_error("nRF24", state);
      }
    }

    // small delay to prevent busy waiting
    hal->delay(10);

  }

  return(0);
}
