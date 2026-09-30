#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/sys/printk.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(MAIN,3);
static const struct device *const usb_uart = DEVICE_DT_GET(DT_NODELABEL(cdc_acm_uart0));

static struct gpio_dt_spec led = GPIO_DT_SPEC_GET_OR(DT_ALIAS(cxk), gpios,
						     {0});

int main(void)
{
	if(!device_is_ready(usb_uart));
	if(!device_is_ready(led.port))
	{
		LOG_ERR("What fucking");
		return 0;
	}
	printk("%s",led.port->name);
	gpio_pin_configure_dt(&led,GPIO_OUTPUT_INACTIVE);
	while (1)
	{
		gpio_pin_set_dt(&led,1);
		k_sleep(K_MSEC(500));
		gpio_pin_set_dt(&led,0);
		k_sleep(K_MSEC(500));
		printk("Fuck,m3\n");
	}
	
	return 0;
}