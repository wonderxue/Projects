#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "pico/binary_info.h"

const uint LED_PIN = 25;

int main() {


stdio_init_all();

bi_decl(bi_program_description("This is a test binary."));
 bi_decl(bi_1pin_with_name(LED_PIN, "On-board LED"));
 gpio_init(LED_PIN);
 gpio_set_dir(LED_PIN, GPIO_OUT);
}