/**
 * Pico LVGL Data Transfer Protocol
 * 
 * Pico LVGL显示数据传输协议定义
 */

#ifndef PICO_LVGL_PROTOCOL_H
#define PICO_LVGL_PROTOCOL_H

#include <stdint.h>
#include <stdbool.h>

// ── 常量定义 ──
#define PICO_LVGL_BAUD_RATE        115200
#define PICO_LVGL_BUFFER_SIZE     2048
#define PICO_LVGL_MAX_PACKET      1024
#define PICO_LVGL_HEADER_MAGIC    0x55AA

// ── 数据类型 ──
typedef enum {
    PICO_LVGL_DATA_FRAMEBUFFER = 0x01,   // 帧缓冲区数据
    PICO_LVGL_DATA_CONFIG = 0x02,      // 显示配置
    PICO_LVGL_DATA_STATUS = 0x03,      // 状态信息
    PICO_LVGL_DATA_CONTROL = 0x04,     // 控制命令
    PICO_LVGL_DATA_ACK = 0x05,         // 确认响应
    PICO_LVGL_DATA_NACK = 0x06         // 错误响应
} PicoLvglDataType;

// ── 显示配置结构 ──
typedef struct {
    uint16_t width;          // 显示宽度
    uint16_t height;         // 显示高度
    uint8_t orientation;    // 显示方向
    uint8_t color_depth;     // 颜色深度
    uint8_t scale_factor;   // 缩放因子
    uint8_t target_fps;     // 目标帧率
} PicoLvglConfig;

// ── 状态信息结构 ──
typedef struct {
    uint8_t status;          // 设备状态
    uint8_t error_code;     // 错误代码
    uint16_t free_memory;   // 剩余内存
    uint8_t cpu_usage;      // CPU使用率
    uint16_t frame_count;   // 帧计数
    uint8_t current_fps;    // 当前帧率
} PicoLvglStatusInfo;

// ── 控制命令结构 ──
typedef struct {
    uint8_t command;        // 命令类型
    uint8_t parameter;      // 命令参数
    uint16_t reserved;      // 保留字段
} PicoLvglControl;

// ── 数据包结构 ──
typedef struct {
    uint16_t magic;         // 魔术字 0x55AA
    uint8_t type;           // 数据类型
    uint16_t length;        // 数据长度
    uint8_t data[PICO_LVGL_MAX_PACKET];  // 数据内容
    uint8_t checksum;       // 校验和
} PicoLvglPacket;

// ── 帧缓冲区数据头部 ──
typedef struct {
    uint16_t x;             // 起始X坐标
    uint16_t y;             // 起始Y坐标
    uint16_t width;         // 数据宽度
    uint16_t height;        // 数据高度
    uint8_t format;         // 颜色格式
    uint8_t compression;    // 压缩方式
} PicoLvglFrameHeader;

// ── 命令类型定义 ──
typedef enum {
    PICO_CMD_START_STREAM = 0x01,    // 开始数据流
    PICO_CMD_STOP_STREAM = 0x02,     // 停止数据流
    PICO_CMD_SET_CONFIG = 0x03,     // 设置配置
    PICO_CMD_RESET = 0x04,          // 重置设备
    PICO_CMD_CAPTURE_FRAME = 0x05    // 捕获帧
} PicoLvglCommand;

// ── 状态代码定义 ──
typedef enum {
    PICO_STATUS_OK = 0x00,           // 正常
    PICO_STATUS_ERROR = 0x01,        // 一般错误
    PICO_STATUS_BUSY = 0x02,         // 设备忙
    PICO_STATUS_TIMEOUT = 0x03,      // 超时
    PICO_STATUS_MEMORY_ERROR = 0x04, // 内存错误
    PICO_STATUS_COMM_ERROR = 0x05    // 通信错误
} PicoLvglStatus;

// ── 颜色格式定义 ──
typedef enum {
    PICO_COLOR_FORMAT_RGB565 = 0x01, // RGB565
    PICO_COLOR_FORMAT_RGB888 = 0x02, // RGB888
    PICO_COLOR_FORMAT_ARGB8888 = 0x03 // ARGB8888
} PicoLvglColorFormat;

// ── 压缩方式定义 ──
typedef enum {
    PICO_COMPRESSION_NONE = 0x00,    // 无压缩
    PICO_COMPRESSION_RLE = 0x01,     // RLE压缩
    PICO_COMPRESSION_LZ4 = 0x02      // LZ4压缩
} PicoLvglCompression;

// ── 函数声明 ──
// 初始化
bool pico_lvgl_init(const char *port_name);
void pico_lvgl_cleanup(void);

// 数据发送
bool pico_lvgl_send_packet(const PicoLvglPacket *packet);
bool pico_lvgl_send_config(const PicoLvglConfig *config);
bool pico_lvgl_send_frame(const uint8_t *framebuffer, uint16_t x, uint16_t y, 
                         uint16_t width, uint16_t height, uint8_t format);
bool pico_lvgl_send_status(const PicoLvglStatusInfo *status);
bool pico_lvgl_send_command(uint8_t cmd, uint8_t param);

// 数据接收
bool pico_lvgl_receive_packet(PicoLvglPacket *packet);
bool pico_lvgl_wait_for_ack(uint32_t timeout_ms);

// 数据处理
uint8_t calculate_checksum(const uint8_t *data, uint16_t length);
bool validate_packet(const PicoLvglPacket *packet);
void packet_to_screen_data(const PicoLvglPacket *packet);

// 状态查询
bool pico_lvgl_is_connected(void);
uint32_t pico_lvgl_get_bytes_sent(void);
uint32_t pico_lvgl_get_bytes_received(void);

// 辅助函数
const char* pico_lvgl_data_type_to_string(PicoLvglDataType type);
const char* pico_lvgl_status_to_string(uint8_t status);

#endif /* PICO_LVGL_PROTOCOL_H */
