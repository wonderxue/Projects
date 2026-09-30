#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "pio.pio.h"

int main() {
    stdio_init_all();

    PIO pio = pio0;
    uint sm = 0;
    uint offset = pio_add_program(pio, &blink_program);
    pio_sm_config c = blink_program_get_default_config(offset);

    pio_gpio_init(pio, 25);
    sm_config_set_set_pins(&c, 25, 1);

    // 设置分频器为最大值：整数 65535，小数 255/256
    sm_config_set_clkdiv_int_frac(&c, 65535, 255);

    pio_sm_init(pio, sm, offset, &c);

    // 计算延时循环次数：0.5 s / (分频周期)
    // 分频周期 = 65535.99609375 / 150000000 ≈ 4.36906e-4 s
    // 循环次数 = 0.5 / 4.36906e-4 ≈ 1144
    uint32_t loop_count = 1144;
    pio_sm_put_blocking(pio, sm, loop_count);  // 将次数传给 PIO

    pio_sm_set_enabled(pio, sm, true);

    while (1) tight_loop_contents();
}