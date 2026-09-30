/**
 * Pico LVGL Data Receiver - Simplified Version
 * 
 简化版接收器：直接使用SimuScreen核心功能，不依赖SDL3
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <pthread.h>
#include "pico_lvgl_protocol.h"
#include "../../03_SimuScreen/src/screen_simulator.h"

// ── 全局变量 ──
static ScreenSimulator *g_sim = NULL;
static volatile bool g_running = true;
static pthread_t g_comm_thread;
static pthread_t g_render_thread;

// ── 配置参数 ──
typedef struct {
    const char *serial_port;
    const char *screen_style;
    int screen_width;
    int screen_height;
    int pixel_size;
    int margin;
    int target_fps;
    bool enable_compression;
} ReceiverConfig;

static ReceiverConfig g_config = {
    .serial_port = "/dev/tty.usbmodem1101",
    .screen_style = "pixel",
    .screen_width = 800,
    .screen_height = 1200,
    .pixel_size = 1,
    .margin = 0,
    .target_fps = 30,
    .enable_compression = false
};

// ── 信号处理 ──
static void signal_handler(int sig) {
    printf("\nReceived signal %d, shutting down...\n", sig);
    g_running = false;
}

// ── 初始化屏幕模拟器 ──
static bool init_screen_simulator(void) {
    ScreenConfig config = {
        .width = g_config.screen_width,
        .height = g_config.screen_height,
        .pixel_size = g_config.pixel_size,
        .margin = g_config.margin,
        .title = "Pico LVGL Display",
        .style = g_config.screen_style
    };
    
    g_sim = ss_create(&config);
    if (!g_sim) {
        fprintf(stderr, "Failed to create screen simulator\n");
        return false;
    }
    
    printf("Screen simulator initialized: %dx%d, style=%s\n", 
           config.width, config.height, config.style);
    return true;
}

// ── 通信线程 ──
static void* communication_thread(void *arg) {
    printf("Starting communication thread...\n");
    
    // 初始化串口通信
    if (!pico_lvgl_init(g_config.serial_port)) {
        fprintf(stderr, "Failed to initialize communication\n");
        g_running = false;
        return NULL;
    }
    
    // 发送初始配置
    PicoLvglConfig config = {
        .width = g_config.screen_width,
        .height = g_config.screen_height,
        .orientation = 0,
        .color_depth = 24, // RGB888
        .scale_factor = 1,
        .target_fps = g_config.target_fps
    };
    
    if (!pico_lvgl_send_config(&config)) {
        fprintf(stderr, "Failed to send initial config\n");
    }
    
    // 开始数据流
    pico_lvgl_send_command(PICO_CMD_START_STREAM, 0);
    
    // 主通信循环
    while (g_running) {
        PicoLvglPacket packet;
        if (pico_lvgl_receive_packet(&packet)) {
            if (validate_packet(&packet)) {
                packet_to_screen_data(&packet);
                
                // 根据数据类型处理
                switch (packet.type) {
                    case PICO_LVGL_DATA_FRAMEBUFFER: {
                        PicoLvglFrameHeader *header = (PicoLvglFrameHeader*)packet.data;
                        
                        // 确保不超出屏幕边界
                        if (header->x + header->width > g_config.screen_width) {
                            header->width = g_config.screen_width - header->x;
                        }
                        if (header->y + header->height > g_config.screen_height) {
                            header->height = g_config.screen_height - header->y;
                        }
                        
                        // 绘制帧数据
                        uint8_t *pixel_data = &packet.data[sizeof(PicoLvglFrameHeader)];
                        for (int i = 0; i < header->height; i++) {
                            for (int j = 0; j < header->width; j++) {
                                int src_idx = ((i * header->width + j) * 3);
                                if (src_idx + 2 < (int)(packet.length - sizeof(PicoLvglFrameHeader))) {
                                    uint8_t r = pixel_data[src_idx];
                                    uint8_t g = pixel_data[src_idx + 1];
                                    uint8_t b = pixel_data[src_idx + 2];
                                    ss_set_pixel(g_sim, header->x + j, header->y + i, r, g, b, 255);
                                }
                            }
                        }
                        break;
                    }
                        
                    case PICO_LVGL_DATA_CONFIG: {
                        // 屏幕配置更新
                        PicoLvglConfig *new_config = (PicoLvglConfig*)packet.data;
                        printf("Screen config updated: %dx%d\n", new_config->width, new_config->height);
                        break;
                    }
                        
                    case PICO_LVGL_DATA_STATUS: {
                        // Pico状态信息
                        PicoLvglStatusInfo *status = (PicoLvglStatusInfo*)packet.data;
                        printf("Pico status: cpu=%d%%, fps=%d, frames=%d\n", 
                               status->cpu_usage, status->current_fps, status->frame_count);
                        break;
                    }
                        
                    case PICO_LVGL_DATA_ACK:
                        printf("ACK received\n");
                        break;
                        
                    case PICO_LVGL_DATA_NACK:
                        printf("NACK received, error: %d\n", packet.data[0]);
                        break;
                        
                    default:
                        printf("Unknown packet type: %d\n", packet.type);
                        break;
                }
                
                // 发送ACK响应
                PicoLvglPacket ack;
                ack.magic = PICO_LVGL_HEADER_MAGIC;
                ack.type = PICO_LVGL_DATA_ACK;
                ack.length = 0;
                ack.checksum = calculate_checksum(ack.data, ack.length);
                pico_lvgl_send_packet(&ack);
                
            } else {
                // 校验失败，发送NACK
                PicoLvglPacket nack;
                nack.magic = PICO_LVGL_HEADER_MAGIC;
                nack.type = PICO_LVGL_DATA_NACK;
                nack.length = 1;
                nack.data[0] = 0x01; // 校验错误
                nack.checksum = calculate_checksum(nack.data, nack.length);
                pico_lvgl_send_packet(&nack);
            }
        } else {
            // 通信错误，短暂等待后重试
            usleep(10000); // 10ms
        }
    }
    
    // 清理
    pico_lvgl_send_command(PICO_CMD_STOP_STREAM, 0);
    pico_lvgl_cleanup();
    printf("Communication thread stopped\n");
    return NULL;
}

// ── 渲染线程 ──
static void* render_thread(void *arg) {
    printf("Starting render thread...\n");
    
    int frame_delay = 1000000 / g_config.target_fps; // 微秒
    
    while (g_running) {
        // 检查退出请求
        if (ss_poll_quit(g_sim)) {
            g_running = false;
            break;
        }
        
        // 更新和渲染
        ss_tick(g_sim);
        ss_render(g_sim);
        
        // 控制帧率
        usleep(frame_delay);
    }
    
    printf("Render thread stopped\n");
    return NULL;
}

// ── 配置解析 ──
static void parse_arguments(int argc, char *argv[]) {
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--port") == 0 && i + 1 < argc) {
            g_config.serial_port = argv[i + 1];
            i++;
        } else if (strcmp(argv[i], "--style") == 0 && i + 1 < argc) {
            g_config.screen_style = argv[i + 1];
            i++;
        } else if (strcmp(argv[i], "--width") == 0 && i + 1 < argc) {
            g_config.screen_width = atoi(argv[i + 1]);
            i++;
        } else if (strcmp(argv[i], "--height") == 0 && i + 1 < argc) {
            g_config.screen_height = atoi(argv[i + 1]);
            i++;
        } else if (strcmp(argv[i], "--pixel-size") == 0 && i + 1 < argc) {
            g_config.pixel_size = atoi(argv[i + 1]);
            i++;
        } else if (strcmp(argv[i], "--margin") == 0 && i + 1 < argc) {
            g_config.margin = atoi(argv[i + 1]);
            i++;
        } else if (strcmp(argv[i], "--fps") == 0 && i + 1 < argc) {
            g_config.target_fps = atoi(argv[i + 1]);
            i++;
        } else if (strcmp(argv[i], "--compression") == 0) {
            g_config.enable_compression = true;
        } else if (strcmp(argv[i], "--help") == 0) {
            printf("Pico LVGL Data Receiver (Simplified)\n");
            printf("Usage: %s [OPTIONS]\n", argv[0]);
            printf("Options:\n");
            printf("  --port PORT         Serial port (default: %s)\n", g_config.serial_port);
            printf("  --style STYLE       Screen style: pixel, glow, amoled (default: %s)\n", g_config.screen_style);
            printf("  --width WIDTH       Screen width (default: %d)\n", g_config.screen_width);
            printf("  --height HEIGHT     Screen height (default: %d)\n", g_config.screen_height);
            printf("  --pixel-size SIZE   Pixel size (default: %d)\n", g_config.pixel_size);
            printf("  --margin MARGIN     Margin size (default: %d)\n", g_config.margin);
            printf("  --fps FPS           Target FPS (default: %d)\n", g_config.target_fps);
            printf("  --compression       Enable compression (default: disabled)\n");
            printf("  --help              Show this help message\n");
            exit(0);
        }
    }
}

// ── 主函数 ──
int main(int argc, char *argv[]) {
    printf("=== Pico LVGL Data Receiver (Simplified) ===\n");
    
    // 解析命令行参数
    parse_arguments(argc, argv);
    
    // 设置信号处理
    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);
    
    // 初始化屏幕模拟器
    if (!init_screen_simulator()) {
        fprintf(stderr, "Failed to initialize screen simulator\n");
        return 1;
    }
    
    // 创建通信线程
    if (pthread_create(&g_comm_thread, NULL, communication_thread, NULL) != 0) {
        fprintf(stderr, "Failed to create communication thread\n");
        ss_destroy(g_sim);
        return 1;
    }
    
    // 创建渲染线程
    if (pthread_create(&g_render_thread, NULL, render_thread, NULL) != 0) {
        fprintf(stderr, "Failed to create render thread\n");
        g_running = false;
        pthread_join(g_comm_thread, NULL);
        ss_destroy(g_sim);
        return 1;
    }
    
    // 等待线程结束
    pthread_join(g_comm_thread, NULL);
    pthread_join(g_render_thread, NULL);
    
    // 清理资源
    ss_destroy(g_sim);
    pico_lvgl_cleanup();
    
    printf("Application shutdown complete\n");
    
    // 打印统计信息
    printf("Statistics:\n");
    printf("  Bytes sent: %u\n", pico_lvgl_get_bytes_sent());
    printf("  Bytes received: %u\n", pico_lvgl_get_bytes_received());
    
    return 0;
}
