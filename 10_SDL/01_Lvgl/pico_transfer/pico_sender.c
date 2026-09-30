/**
 * Pico LVGL Data Sender
 * 
 * Pico端程序：捕获LVGL显示数据并通过USB发送给电脑
 */

// ── Pico头文件 ──
#include "pico/stdlib.h"
#include "hardware/uart.h"
#include "hardware/dma.h"
#include "hardware/irq.h"
#include "hardware/flash.h"
#include "hardware/clocks.h"
#include "hardware/pio.h"
#include "hardware/i2c.h"
#include "hardware/spi.h"
#include "pico/multicore.h"
#include "pico/time.h"
#include "tusb.h"
#include "usb_descriptors.h"
#include "lvgl.h"
#include "lv_demo_stress.h"

#include "pico_lvgl_protocol.h"

// ── 常量定义 ──
#define UART_ID     uart0
#define BAUD_RATE   115200
#define UART_TX_PIN 0
#define UART_RX_PIN 1

// ── 全局变量 ──
static uint8_t draw_buf[800 * 1200 * 4]; // 帧缓冲区
static uint8_t capture_buf[800 * 1200 * 3]; // 捕获缓冲区 (RGB888)
static bool streaming_enabled = false;
static uint32_t frame_count = 0;
static uint32_t last_frame_time = 0;

// ── LVGL显示刷新回调 ──
void disp_flush(lv_display_t *disp, const lv_area_t *area, uint8_t *px_map) {
    // 这里可以添加数据捕获逻辑
    if (streaming_enabled) {
        capture_frame_area(area, px_map);
    }
    
    lv_display_flush_ready(disp);
}

// ── 帧数据捕获 ──
void capture_frame_area(const lv_area_t *area, uint8_t *px_map) {
    // 捕获指定区域的帧数据
    uint32_t area_width = area->x2 - area->x1 + 1;
    uint32_t area_height = area->y2 - area->y1 + 1;
    
    // 将ARGB8888转换为RGB888
    for (uint32_t y = 0; y < area_height; y++) {
        for (uint32_t x = 0; x < area_width; x++) {
            uint32_t src_idx = ((y * area_width + x) * 4);
            uint32_t dst_idx = ((y * area_width + x) * 3);
            
            if (src_idx + 3 < area_width * area_height * 4) {
                uint8_t a = px_map[src_idx];
                uint8_t r = px_map[src_idx + 1];
                uint8_t g = px_map[src_idx + 2];
                uint8_t b = px_map[src_idx + 3];
                
                // 简单的Alpha混合
                if (a == 0xFF) {
                    capture_buf[dst_idx] = r;
                    capture_buf[dst_idx + 1] = g;
                    capture_buf[dst_idx + 2] = b;
                } else {
                    capture_buf[dst_idx] = r;
                    capture_buf[dst_idx + 1] = g;
                    capture_buf[dst_idx + 2] = b;
                }
            }
        }
    }
}

// ── 数据发送 ──
void send_frame_data(uint16_t x, uint16_t y, uint16_t width, uint16_t height) {
    PicoLvglFrameHeader header;
    header.x = x;
    header.y = y;
    header.width = width;
    header.height = height;
    header.format = PICO_COLOR_FORMAT_RGB888;
    header.compression = PICO_COMPRESSION_NONE;
    
    PicoLvglPacket packet;
    packet.magic = PICO_LVGL_HEADER_MAGIC;
    packet.type = PICO_LVGL_DATA_FRAMEBUFFER;
    packet.length = sizeof(PicoLvglFrameHeader) + (width * height * 3);
    
    // 复制帧头
    memcpy(packet.data, &header, sizeof(PicoLvglFrameHeader));
    
    // 复制像素数据
    memcpy(&packet.data[sizeof(PicoLvglFrameHeader)], capture_buf, width * height * 3);
    
    packet.checksum = calculate_checksum(packet.data, packet.length);
    
    // 通过USB CDC发送数据
    tud_cdc_write(packet.data, sizeof(PicoLvglPacket));
    tud_cdc_write_flush();
}

// ── 状态信息发送 ──
void send_status_info(void) {
    PicoLvglStatus status;
    status.status = PICO_STATUS_OK;
    status.error_code = 0;
    status.free_memory = get_free_memory();
    status.cpu_usage = get_cpu_usage();
    status.frame_count = frame_count;
    status.current_fps = get_current_fps();
    
    PicoLvglPacket packet;
    packet.magic = PICO_LVGL_HEADER_MAGIC;
    packet.type = PICO_LVGL_DATA_STATUS;
    packet.length = sizeof(PicoLvglStatus);
    memcpy(packet.data, &status, sizeof(PicoLvglStatus));
    packet.checksum = calculate_checksum(packet.data, packet.length);
    
    tud_cdc_write(packet.data, sizeof(PicoLvglPacket));
    tud_cdc_write_flush();
}

// ── USB CDC回调函数 ──
void tud_cdc_rx_cb(uint8_t itf) {
    uint8_t buf[64];
    uint32_t count = tud_cdc_read(buf, sizeof(buf));
    
    if (count > 0) {
        // 解析接收到的命令
        process_command(buf, count);
    }
}

void tud_cdc_tx_complete_cb(uint8_t itf) {
    // 发送完成回调
}

// ── 命令处理 ──
void process_command(uint8_t *data, uint32_t length) {
    if (length < 3) return;
    
    uint8_t cmd = data[0];
    uint8_t param = data[1];
    
    switch (cmd) {
        case PICO_CMD_START_STREAM:
            streaming_enabled = true;
            printf("Stream started\n");
            break;
            
        case PICO_CMD_STOP_STREAM:
            streaming_enabled = false;
            printf("Stream stopped\n");
            break;
            
        case PICO_CMD_SET_CONFIG:
            // 处理配置更新
            printf("Config update: %d\n", param);
            break;
            
        case PICO_CMD_RESET:
            reset_pico();
            break;
            
        case PICO_CMD_CAPTURE_FRAME:
            // 立即捕获当前帧
            capture_full_frame();
            break;
    }
}

// ── 系统功能 ──
void capture_full_frame(void) {
    // 捕获完整帧
    lv_obj_t *scr = lv_screen_active();
    lv_area_t area;
    lv_obj_get_coords(scr, &area);
    
    capture_frame_area(&area, draw_buf);
    
    // 发送帧数据
    send_frame_data(0, 0, area.x2 + 1, area.y2 + 1);
    
    frame_count++;
}

uint16_t get_free_memory(void) {
    // 返回剩余内存
    return 16384; // 伪代码
}

uint8_t get_cpu_usage(void) {
    // 返回CPU使用率
    return 25; // 伪代码
}

uint8_t get_current_fps(void) {
    // 返回当前帧率
    uint32_t current_time = to_ms_since_boot();
    if (current_time - last_frame_time > 0) {
        return 1000 / (current_time - last_frame_time);
    }
    return 30;
}

void reset_pico(void) {
    // 重置Pico
    reset_usb_boot(0, 0);
}

// ── 主程序 ──
int main() {
    // 初始化标准库
    stdio_init_all();
    
    // 初始化USB
    tusb_init();
    
    // 初始化UART（用于调试）
    uart_init(UART_ID, BAUD_RATE);
    gpio_set_function(UART_TX_PIN, GPIO_FUNC_UART);
    gpio_set_function(UART_RX_PIN, GPIO_FUNC_UART);
    
    // 初始化LVGL
    lv_init();
    
    // 创建显示驱动
    static lv_display_t *disp = lv_display_create(800, 1200);
    lv_display_set_buffers(disp, draw_buf, NULL, sizeof(draw_buf), LV_DISPLAY_RENDER_MODE_FULL);
    lv_display_set_flush_cb(disp, disp_flush);
    lv_display_set_color_format(disp, LV_COLOR_FORMAT_ARGB8888);
    
    // 创建示例界面
    create_demo_ui();
    
    printf("Pico LVGL Sender initialized\n");
    
    // 主循环
    uint32_t last_status_time = 0;
    uint32_t last_capture_time = 0;
    
    while (1) {
        uint32_t current_time = to_ms_since_boot();
        
        // USB任务处理
        tud_task();
        
        // 定期发送状态信息
        if (current_time - last_status_time > 1000) { // 每秒一次
            send_status_info();
            last_status_time = current_time;
        }
        
        // 流式传输
        if (streaming_enabled) {
            if (current_time - last_capture_time > 33) { // 30 FPS
                capture_full_frame();
                last_capture_time = current_time;
                last_frame_time = current_time;
            }
        }
        
        // LVGL任务处理
        lv_timer_handler();
        
        // 小延迟
        sleep_us(100);
    }
    
    return 0;
}

// ── 示例UI创建 ──
void create_demo_ui(void) {
    // 创建一个简单的演示界面
    lv_obj_t *main_page = lv_obj_create(lv_screen_active());
    lv_obj_set_size(main_page, LV_HOR_RES / 2, LV_VER_RES / 2);
    lv_obj_set_flex_flow(main_page, LV_FLEX_FLOW_COLUMN_WRAP);
    lv_obj_center(main_page);
    
    // 创建一个圆形进度条
    lv_obj_t *arc = lv_arc_create(main_page);
    lv_obj_set_size(arc, 200, 200);
    lv_arc_set_value(arc, 75);
    
    // 创建标签
    lv_obj_t *label = lv_label_create(main_page);
    lv_label_set_text(label, "Pico LVGL\nData Transfer");
    lv_obj_set_style_text_font(label, &lv_font_montserrat_24, 0);
    
    printf("Demo UI created\n");
}
