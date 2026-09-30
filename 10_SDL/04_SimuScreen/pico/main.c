/**
 * Pico2040 USB Data Sender
 *
 * 使用 Pico2040 通过 USB CDC 上传 LVGL 渲染数据到上位机
 *
 * 数据包格式（小端序）：
 *   [width:2][height:2][x:2][y:2][RGB888 data: w*h*3]
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>

#include "pico/stdlib.h"
#include "pico/stdio_usb.h"
#include "tusb.h"
#include "cdc_device.h"
#include "lvgl.h"

/*============================================================
 * 配置
 *============================================================*/
#define SCREEN_WIDTH   128
#define SCREEN_HEIGHT  128

/* LVGL 绘制缓冲区行数（越大越省刷新次数，但越占 RAM） */
#define LVGL_DRAW_BUF_LINES  20

/*============================================================
 * USB 数据包结构
 *============================================================*/
typedef struct __attribute__((packed)) {
    uint16_t width;
    uint16_t height;
    uint16_t x;
    uint16_t y;
    /* 后面跟 width*height*3 字节的 RGB888 数据 */
} USBDataHeader;

/*============================================================
 * USB CDC 初始化
 *============================================================*/
static void init_usb_cdc(void)
{
    stdio_usb_init();

    /* 等待上位机打开串口并置起 DTR */
    while (!stdio_usb_connected()) {
        sleep_ms(100);
    }

    /* 稍微等一下，确保主机端完成枚举 */
    sleep_ms(100);

    printf("USB CDC connected\n");
}

/*============================================================
 * 通过 USB CDC 发送数据（带重试）
 *============================================================*/
static void send_usb_data(const uint8_t *data, size_t size)
{
    const uint32_t timeout_ms = 1000;
    absolute_time_t deadline = make_timeout_time_ms(timeout_ms);

    while (size > 0) {
        uint32_t sent = tud_cdc_write(data, size);
        if (sent > 0) {
            data += sent;
            size -= sent;
        } else {
            /* 发送缓冲区满：刷新并稍等 */
            tud_cdc_write_flush();
            if (time_reached(deadline)) {
                /* 超时，丢弃剩余数据避免卡死 */
                break;
            }
            sleep_ms(1);
        }
    }

    tud_cdc_write_flush();
}

/*============================================================
 * LVGL 颜色 -> RGB888
 *============================================================*/
static inline void color_to_rgb888(lv_color_t c, uint8_t *out)
{
    uint32_t rgb = lv_color_to_u32(c);
    out[0] = (rgb >> 16) & 0xFF;  /* R */
    out[1] = (rgb >>  8) & 0xFF;  /* G */
    out[2] =  rgb        & 0xFF;  /* B */
}

/*============================================================
 * LVGL flush 回调：把渲染好的区域通过 USB 发出去
 *============================================================*/
static void my_flush_cb(lv_display_t *disp, const lv_area_t *area, uint8_t *px_map)
{
    int32_t w = area->x2 - area->x1 + 1;
    int32_t h = area->y2 - area->y1 + 1;

    if (w <= 0 || h <= 0) {
        lv_display_flush_ready(disp);
        return;
    }

    size_t data_size = (size_t)w * (size_t)h * 3;
    size_t pkt_size  = sizeof(USBDataHeader) + data_size;

    uint8_t *pkt = (uint8_t *)malloc(pkt_size);
    if (!pkt) {
        lv_display_flush_ready(disp);
        return;
    }

    USBDataHeader *hdr = (USBDataHeader *)pkt;
    hdr->width  = (uint16_t)w;
    hdr->height = (uint16_t)h;
    hdr->x      = (uint16_t)area->x1;
    hdr->y      = (uint16_t)area->y1;

    uint8_t *out = pkt + sizeof(USBDataHeader);

    /* LVGL v9: 渲染出来的缓冲区像素格式由 LV_COLOR_DEPTH 决定，
     * 但 lv_color_t 始终按 RGB888 逻辑存储。 */
    const lv_color_t *src = (const lv_color_t *)px_map;
    for (int32_t i = 0; i < w * h; i++) {
        color_to_rgb888(src[i], out + i * 3);
    }

    send_usb_data(pkt, pkt_size);

    free(pkt);

    lv_display_flush_ready(disp);
}

/*============================================================
 * LVGL 初始化
 *============================================================*/
static lv_display_t *g_disp = NULL;

static void lvgl_init(void)
{
    lv_init();

    /* 双缓冲，每个缓冲区 SCREEN_WIDTH * LVGL_DRAW_BUF_LINES 像素 */
    static lv_color_t buf1[SCREEN_WIDTH * LVGL_DRAW_BUF_LINES];
    static lv_color_t buf2[SCREEN_WIDTH * LVGL_DRAW_BUF_LINES];

    g_disp = lv_display_create(SCREEN_WIDTH, SCREEN_HEIGHT);
    lv_display_set_buffers(g_disp, buf1, buf2, sizeof(buf1),
                           LV_DISPLAY_RENDER_MODE_PARTIAL);
    lv_display_set_flush_cb(g_disp, my_flush_cb);

    printf("LVGL initialized (%dx%d)\n", SCREEN_WIDTH, SCREEN_HEIGHT);
}

/*============================================================
 * 创建测试 UI
 *============================================================*/
static void create_test_ui(void)
{
    lv_obj_t *scr = lv_screen_active();
    lv_obj_set_style_bg_color(scr, lv_color_hex(0x101820), LV_PART_MAIN);
    lv_obj_set_style_bg_opa(scr, LV_OPA_COVER, LV_PART_MAIN);

    /* 标题 */
    lv_obj_t *title = lv_label_create(scr);
    lv_label_set_text(title, "Pico USB LVGL");
    lv_obj_set_style_text_color(title, lv_color_hex(0x00E0FF), LV_PART_MAIN);
    lv_obj_align(title, LV_ALIGN_TOP_MID, 0, 10);

    /* 进度条 */
    lv_obj_t *bar = lv_bar_create(scr);
    lv_obj_set_size(bar, 100, 12);
    lv_obj_align(bar, LV_ALIGN_CENTER, 0, 0);
    lv_bar_set_range(bar, 0, 100);
    lv_bar_set_value(bar, 60, LV_ANIM_OFF);

    /* 让进度条动起来 */
    lv_anim_t a;
    lv_anim_init(&a);
    lv_anim_set_var(&a, bar);
    lv_anim_set_values(&a, 0, 100);
    lv_anim_set_duration(&a, 2000);
    lv_anim_set_playback_duration(&a, 2000);
    lv_anim_set_repeat_count(&a, LV_ANIM_REPEAT_INFINITE);
    lv_anim_set_exec_cb(&a, (lv_anim_exec_xcb_t)lv_bar_set_value);
    lv_anim_start(&a);

    /* 计数标签 */
    lv_obj_t *lbl = lv_label_create(scr);
    lv_label_set_text(lbl, "frame: 0");
    lv_obj_set_style_text_color(lbl, lv_color_hex(0xFFFFFF), LV_PART_MAIN);
    lv_obj_align(lbl, LV_ALIGN_BOTTOM_MID, 0, -10);
}

/*============================================================
 * 主函数
 *============================================================*/
int main(void)
{
    stdio_init_all();
    sleep_ms(2000);   /* 等 USB / 串口稳定 */

    printf("\n=== Pico2040 USB LVGL Sender ===\n");

    init_usb_cdc();
    lvgl_init();
    create_test_ui();

    uint32_t frame = 0;
    uint32_t last_report = to_ms_since_boot(get_absolute_time());

    while (1) {
        /* LVGL 定时器处理：驱动动画、刷新 */
        uint32_t idle_ms = lv_timer_handler();
        if (idle_ms > 5) idle_ms = 5;
        sleep_ms(idle_ms);

        /* 每 2 秒打印一次状态 */
        uint32_t now = to_ms_since_boot(get_absolute_time());
        if (now - last_report >= 2000) {
            last_report = now;
            printf("running... frame=%lu\n", (unsigned long)frame);
        }
        frame++;
    }

    return 0;
}