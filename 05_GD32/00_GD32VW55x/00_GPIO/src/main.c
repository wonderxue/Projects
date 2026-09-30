#include "main.h"

#include "gd32vw55x.h"
#include "gd32vw553h_eval.h"
#include "systick.h"
#include <stdio.h>

/*!
    \brief      main function
    \param[in]  none
    \param[out] none
    \retval     none
*/
int main(void)
{
    systick_config();

    /* enable the LED clock */
    rcu_periph_clock_enable(RCU_GPIOA);
	/* enable the LED clock */
    rcu_periph_clock_enable(RCU_GPIOC);
    /* configure LED GPIO port */
    gpio_mode_set(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6);
	gpio_mode_set(GPIOC, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO_PIN_13 | GPIO_PIN_5 | GPIO_PIN_6);

    gpio_bit_reset(GPIOA, GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6);

    while(1) {
        /* turn on LED1, turn off LED3 */
        gpio_bit_set(GPIOC, GPIO_PIN_13);
        gpio_bit_reset(GPIOA, GPIO_PIN_6);
        delay_1ms(1000);

        /* turn on LED2, turn off LED1 */
        gpio_bit_set(GPIOA, GPIO_PIN_5);
        gpio_bit_reset(GPIOC, GPIO_PIN_13);
        delay_1ms(1000);

        /* turn on LED3, turn off LED2 */
        gpio_bit_set(GPIOA, GPIO_PIN_6);
        gpio_bit_reset(GPIOA, GPIO_PIN_5);
        delay_1ms(1000);
    }
}