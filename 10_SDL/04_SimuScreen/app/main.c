/**
 * USB Data Receiver -上位机应用
 * 
 * 接受USB数据并绘制到模拟屏幕上
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <SDL3/SDL.h>

#include "../src/screen_simulator.h"

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 128
#define PIXEL_SIZE 2
#define MARGIN 10
#define FPS 60
#define USB_BUFFER_SIZE 4096

// USB数据包格式
typedef struct {
    uint16_t width;
    uint16_t height;
    uint16_t x;
    uint16_t y;
    uint8_t *data;  // 指针而不是数组
} USBDataPacket;

// USB串口配置
static int init_usb_serial(const char *device) {
    int fd = open(device, O_RDWR | O_NOCTTY | O_NONBLOCK);
    if (fd < 0) {
        fprintf(stderr, "无法打开USB设备 %s: %s\n", device, strerror(errno));
        return -1;
    }

    // 配置串口
    struct termios tty;
    memset(&tty, 0, sizeof(tty));
    
    if (tcgetattr(fd, &tty) != 0) {
        fprintf(stderr, "tcgetattr failed: %s\n", strerror(errno));
        close(fd);
        return -1;
    }

    // 设置波特率 115200
    cfsetispeed(&tty, B115200);
    cfsetospeed(&tty, B115200);

    // 8N1 配置
    tty.c_cflag &= ~PARENB;  // 无奇偶校验
    tty.c_cflag &= ~CSTOPB;  // 1个停止位
    tty.c_cflag &= ~CSIZE;   // 清除数据位掩码
    tty.c_cflag |= CS8;      // 8个数据位
    tty.c_cflag &= ~CRTSCTS; // 无硬件流控制
    tty.c_cflag |= CREAD | CLOCAL; // 启用接收，本地模式

    // 设置输入模式
    tty.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
    tty.c_iflag &= ~(IXON | IXOFF | IXANY); // 无软件流控制
    tty.c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP | INLCR | IGNCR | ICRNL);

    // 设置输出模式
    tty.c_oflag &= ~OPOST;
    tty.c_oflag &= ~ONLCR;

    // 设置最小字符和计时
    tty.c_cc[VMIN] = 1;  // 最小1个字符
    tty.c_cc[VTIME] = 5;  // 0.5秒超时

    if (tcsetattr(fd, TCSANOW, &tty) != 0) {
        fprintf(stderr, "tcsetattr failed: %s\n", strerror(errno));
        close(fd);
        return -1;
    }

    return fd;
}

// 读取USB数据
static int read_usb_data(int fd, uint8_t *buffer, size_t buffer_size) {
    ssize_t bytes_read = read(fd, buffer, buffer_size);
    if (bytes_read < 0) {
        if (errno == EAGAIN || errno == EWOULDBLOCK) {
            return 0;  // 非阻塞模式下没有数据
        }
        fprintf(stderr, "读取USB数据失败: %s\n", strerror(errno));
        return -1;
    }
    return (int)bytes_read;
}

// 解析USB数据包
static int parse_usb_packet(const uint8_t *data, size_t data_size, USBDataPacket **packet) {
    if (data_size < sizeof(USBDataPacket)) {
        return -1;  // 数据包太小
    }

    USBDataPacket *pkt = (USBDataPacket *)malloc(sizeof(USBDataPacket));
    if (!pkt) {
        return -1;
    }

    memcpy(pkt, data, sizeof(USBDataPacket));
    
    // 计算数据部分大小
    size_t data_len = data_size - sizeof(USBDataPacket);
    pkt->data = (uint8_t *)malloc(data_len);
    if (!pkt->data) {
        free(pkt);
        return -1;
    }
    
    memcpy(pkt->data, data + sizeof(USBDataPacket), data_len);
    *packet = pkt;
    
    return 0;
}

// 绘制USB数据到屏幕
static void draw_usb_data(ScreenSimulator *sim, USBDataPacket *packet) {
    // 清除屏幕
    ss_clear(sim, 0, 0, 0);
    
    // 绘制接收到的数据
    for (uint16_t y = 0; y < packet->height && y < sim->config.height; y++) {
        for (uint16_t x = 0; x < packet->width && x < sim->config.width; x++) {
            // 简单的颜色映射 - 实际应用中需要根据具体协议解析
            uint8_t r = packet->data[(y * packet->width + x) * 3 + 0];
            uint8_t g = packet->data[(y * packet->width + x) * 3 + 1];
            uint8_t b = packet->data[(y * packet->width + x) * 3 + 2];
            
            ss_set_pixel(sim, packet->x + x, packet->y + y, r, g, b, 255);
        }
    }
}

// 主函数
int main(int argc, char *argv[]) {
    printf("开始初始化...\n");
    
    // 初始化SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        fprintf(stderr, "SDL初始化失败: %s\n", SDL_GetError());
        return 1;
    }
    printf("SDL初始化成功\n");
    
    // 初始化模拟屏幕
    ScreenConfig config = {
        .width = SCREEN_WIDTH,
        .height = SCREEN_HEIGHT,
        .pixel_size = PIXEL_SIZE,
        .margin = MARGIN,
        .title = "USB Screen Simulator"
    };
    
    printf("创建ScreenSimulator...\n");
    ScreenSimulator *sim = ss_create(&config);
    if (!sim) {
        fprintf(stderr, "无法创建模拟屏幕\n");
        SDL_Quit();
        return 1;
    }
    printf("ScreenSimulator创建成功\n");

    // 注册像素样式
    printf("注册像素样式...\n");
    ss_register_pixel_style(sim);
    printf("像素样式注册成功\n");
    
    // 初始化USB串口
    const char *usb_device = "/dev/ttyACM0";  // 默认USB设备
    if (argc > 1) {
        usb_device = argv[1];
    }
    
    printf("初始化USB串口: %s\n", usb_device);
    int usb_fd = init_usb_serial(usb_device);
    if (usb_fd < 0) {
        ss_destroy(sim);
        SDL_Quit();
        fprintf(stderr, "无法初始化USB设备\n");
        return 1;
    }
    printf("USB串口初始化成功\n");

    printf("USB Screen Simulator 启动\n");
    printf("监听设备: %s\n", usb_device);
    printf("按ESC键退出\n");

    // 主循环
    uint8_t usb_buffer[USB_BUFFER_SIZE];
    USBDataPacket *packet = NULL;

    int frame_count = 0;
    while (1) {
        frame_count++;
        if (frame_count % 60 == 0) {
            printf("运行中... 帧数: %d\n", frame_count);
        }
        
        // 处理事件
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_EVENT_QUIT) {
                printf("收到退出事件\n");
                if (packet) {
                    free(packet->data);
                    free(packet);
                }
                close(usb_fd);
                ss_destroy(sim);
                SDL_Quit();
                return 0;
            }
            if (event.type == SDL_EVENT_KEY_DOWN) {
                if (event.key.key == SDLK_ESCAPE) {
                    printf("收到ESC键\n");
                    if (packet) {
                        free(packet->data);
                        free(packet);
                    }
                    close(usb_fd);
                    ss_destroy(sim);
                    SDL_Quit();
                    return 0;
                }
            }
        }

        // 读取USB数据
        int bytes_read = read_usb_data(usb_fd, usb_buffer, sizeof(usb_buffer));
        if (bytes_read > 0) {
            // 解析数据包
            if (parse_usb_packet(usb_buffer, bytes_read, &packet) == 0) {
                // 绘制数据到屏幕
                draw_usb_data(sim, packet);
                free(packet->data);
                free(packet);
                packet = NULL;
            }
        }

        // 更新模拟屏幕
        ss_tick(sim);
        ss_render(sim);
        ss_delay_ms(sim, 1000 / FPS);
    }

    return 0;
}
