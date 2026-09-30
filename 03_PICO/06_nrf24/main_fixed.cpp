/*
  RadioLib nRF24 Raspberry Pi Pico library example

  Licensed under the MIT License

  Copyright (c) 2024 Cameron Goddard

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

// define pins to be used
#define SPI_PORT spi0
#define SPI_MISO 4
#define SPI_MOSI 3
#define SPI_SCK 2

#define RFM_NSS 26    // CS pin
#define RFM_RST 22    // RESET pin  
#define RFM_IRQ 14    // IRQ pin
#define RFM_CE 15     // CE pin

#include <pico/stdlib.h>

// include the library
#include <RadioLib.h>

// include the hardware abstraction layer
#include "hal/RPiPico/PicoHal.h"

// create a new instance of the HAL class
PicoHal* hal = new PicoHal(SPI_PORT, SPI_MISO, SPI_MOSI, SPI_SCK);

// create Module instance first
Module mod(hal, RFM_NSS, RFM_IRQ, RFM_RST);

// now create the nRF24 radio module
nRF24 radio = &mod;

// transmit address
byte addr[] = {0x01, 0x23, 0x45, 0x67, 0x89};

int main() {
  // initialize just like with Arduino
  printf("[nRF24] Initializing ... ");
  
  // configure nRF24
  ConfigFSK_t config;
  config.frequency = 2400;  // 2.4 GHz
  int state = radio.begin(config);
  if (state != RADIOLIB_ERR_NONE) {
    printf("failed, code %d\n", state);
    return(1);
  }
  printf("success!\n");

  // set transmit address
  printf("[nRF24] Setting transmit pipe ... ");
  state = radio.setTransmitPipe(addr);
  if (state != RADIOLIB_ERR_NONE) {
    printf("failed, code %d\n", state);
    return(1);
  }
  printf("success!\n");

  // loop forever
  int count = 0;
  for(;;) {
    // send a packet
    printf("[nRF24] Transmitting packet ... ");
    
    // you can transmit C-string or Arduino string up to 32 characters long
    String str = "Hello World! #" + String(count++);
    int state = radio.transmit(str);

    if(state == RADIOLIB_ERR_NONE) {
      // the packet was successfully transmitted
      printf("success!\n");

    } else if (state == RADIOLIB_ERR_PACKET_TOO_LONG) {
      printf("too long!\n");
      
    } else if (state == RADIOLIB_ERR_ACK_NOT_RECEIVED) {
      printf("ACK not received!\n");
      
    } else if (state == RADIOLIB_ERR_TX_TIMEOUT) {
      printf("timeout!\n");
      
    } else {
      printf("failed, code %d\n", state);
    }

    // wait for a second before transmitting again
    hal->delay(1000);

  }

  return(0);
}
