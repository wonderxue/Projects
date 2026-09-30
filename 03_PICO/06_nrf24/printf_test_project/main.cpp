/*
  Simple printf test without RadioLib
*/

#include <pico/stdlib.h>
#include <stdio.h>

int main() {
    // Initialize USB CDC (virtual serial port)
    stdio_init_all();
    
    // Small delay to ensure USB is ready
    sleep_ms(2000);
    
    printf("=== Pico printf Test ===\n");
    printf("Testing printf output...\n");
    printf("This should appear in your serial terminal!\n");
    
    int count = 0;
    while(true) {
        printf("Count: %d\n", count++);
        sleep_ms(1000);
    }
    
    return 0;
}
