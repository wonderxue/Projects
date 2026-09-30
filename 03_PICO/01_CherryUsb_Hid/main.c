#include <stdio.h>
#include <stdint.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "hardware/irq.h"
extern void hid_mouse_init(uint8_t busid, uintptr_t reg_base);
extern void hid_mouse_test(uint8_t busid);
int main() {
	// stdio_init_all();
	gpio_init(25);
	gpio_set_dir(25,GPIO_OUT);
	hid_mouse_init(0, 0);
	gpio_put(25,1);
	
	while (1)
	{
		/* code */
		hid_mouse_test(0);
		
	}
	
}
void gpio_led_toggle()
{
	static int i=0;
	i++;
	if(i==100)
	{
		gpio_put(25,0);
	}
	if(i==200)
	{
		gpio_put(25,1);
		i=0;
	}
}