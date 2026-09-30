/**
 * Pico LVGL Data Transfer Implementation
 * 
 * Pico LVGL显示数据传输实现
 */

#include "pico_lvgl_protocol.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>
#include <sys/time.h>

// ── 私有数据 ──
static int serial_port = -1;
static bool connected = false;
static uint32_t bytes_sent = 0;
static uint32_t bytes_received = 0;

// ── CRC8计算表 ──
static const uint8_t crc8_table[256] = {
    0x00, 0x07, 0x0E, 0x09, 0x1C, 0x1B, 0x12, 0x15, 0x38, 0x3F, 0x36, 0x31, 0x24, 0x23, 0x2A, 0x2D,
    0x70, 0x77, 0x7E, 0x79, 0x6C, 0x6B, 0x62, 0x65, 0x48, 0x4F, 0x46, 0x41, 0x54, 0x53, 0x5A, 0x5D,
    0xE0, 0xE7, 0xEE, 0xE9, 0xFC, 0xFB, 0xF2, 0xF5, 0xD8, 0xDF, 0xD6, 0xD1, 0xC4, 0xC3, 0xCA, 0xCD,
    0x90, 0x97, 0x9E, 0x99, 0x8C, 0x8B, 0x82, 0x85, 0xA8, 0xAF, 0xA6, 0xA1, 0xB4, 0xB3, 0xBA, 0xBD,
    0xC7, 0xC0, 0xC9, 0xCE, 0xDB, 0xDC, 0xD5, 0xD2, 0xFF, 0xF8, 0xF1, 0xF6, 0xE3, 0xE4, 0xED, 0xEA,
    0xB7, 0xB0, 0xB9, 0xBE, 0xAB, 0xAC, 0xA5, 0xA2, 0x8F, 0x88, 0x81, 0x86, 0x93, 0x94, 0x9D, 0x9A,
    0x27, 0x20, 0x29, 0x2E, 0x3B, 0x3C, 0x35, 0x32, 0x1F, 0x18, 0x11, 0x16, 0x03, 0x04, 0x0D, 0x0A,
    0x57, 0x50, 0x59, 0x5E, 0x4B, 0x4C, 0x45, 0x42, 0x6F, 0x68, 0x61, 0x66, 0x73, 0x74, 0x7D, 0x7A,
    0x89, 0x8E, 0x87, 0x80, 0x95, 0x92, 0x9D, 0x9A, 0xB1, 0xB6, 0xBB, 0xBC, 0xA9, 0xAE, 0xA7, 0xA0,
    0xE1, 0xE6, 0xEB, 0xEC, 0xF9, 0xF8, 0xF1, 0xF6, 0xD1, 0xD6, 0xDB, 0xDC, 0xC1, 0xC6, 0xCB, 0xCC,
    0x71, 0x76, 0x7B, 0x7C, 0x61, 0x66, 0x6B, 0x6C, 0x51, 0x56, 0x5B, 0x5C, 0x41, 0x46, 0x4B, 0x4C,
    0x01, 0x06, 0x0B, 0x0C, 0x11, 0x16, 0x1B, 0x1C, 0x21, 0x26, 0x2B, 0x2C, 0x31, 0x36, 0x3B, 0x3C,
    0x81, 0x86, 0x8B, 0x8C, 0x91, 0x96, 0x9B, 0x9C, 0xA1, 0xA6, 0xAB, 0xAC, 0xB1, 0xB6, 0xBB, 0xBC,
    0xC1, 0xC6, 0xCB, 0xCC, 0xD1, 0xD6, 0xDB, 0xDC, 0xF1, 0xF6, 0xFB, 0xFC, 0xE1, 0xE6, 0xEB, 0xEC,
    0x0D, 0x0A, 0x07, 0x00, 0x15, 0x12, 0x1D, 0x1A, 0x35, 0x32, 0x3D, 0x3A, 0x25, 0x22, 0x2D, 0x2A,
    0x5D, 0x5A, 0x57, 0x50, 0x65, 0x62, 0x6D, 0x6A, 0x45, 0x42, 0x4D, 0x4A, 0x75, 0x72, 0x7D, 0x7A,
    0x9D, 0x9A, 0x97, 0x90, 0xA5, 0xA2, 0xAD, 0xAA, 0xB5, 0xB2, 0xBD, 0xBA, 0xC5, 0xC2, 0xCD, 0xCA,
    0xDD, 0xDA, 0xD7, 0xD0, 0xF5, 0xF2, 0xFD, 0xFA, 0xED, 0xEA, 0xE7, 0xE0, 0xCD, 0xCA, 0xC7, 0xC0,
    0x1D, 0x1A, 0x17, 0x10, 0x0D, 0x0A, 0x07, 0x00, 0x1D, 0x1A, 0x17, 0x10, 0x0D, 0x0A, 0x07, 0x00,
    0x5D, 0x5A, 0x57, 0x50, 0x4D, 0x4A, 0x47, 0x40, 0x5D, 0x5A, 0x57, 0x50, 0x4D, 0x4A, 0x47, 0x40,
    0xBD, 0xBA, 0xB7, 0xB0, 0xAD, 0xAA, 0xA7, 0xA0, 0xBD, 0xBA, 0xB7, 0xB0, 0xAD, 0xAA, 0xA7, 0xA0,
    0xDD, 0xDA, 0xD7, 0xD0, 0xCD, 0xCA, 0xC7, 0xC0, 0xDD, 0xDA, 0xD7, 0xD0, 0xCD, 0xCA, 0xC7, 0xC0,
    0x9D, 0x9A, 0x97, 0x90, 0x8D, 0x8A, 0x87, 0x80, 0x9D, 0x9A, 0x97, 0x90, 0x8D, 0x8A, 0x87, 0x80,
    0xDD, 0xDA, 0xD7, 0xD0, 0xCD, 0xCA, 0xC7, 0xC0, 0xDD, 0xDA, 0xD7, 0xD0, 0xCD, 0xCA, 0xC7, 0xC0,
    0x1D, 0x1A, 0x17, 0x10, 0x0D, 0x0A, 0x07, 0x00, 0x1D, 0x1A, 0x17, 0x10, 0x0D, 0x0A, 0x07, 0x00,
    0x5D, 0x5A, 0x57, 0x50, 0x4D, 0x4A, 0x47, 0x40, 0x5D, 0x5A, 0x57, 0x50, 0x4D, 0x4A, 0x47, 0x40,
    0xBD, 0xBA, 0xB7, 0xB0, 0xAD, 0xAA, 0xA7, 0xA0, 0xBD, 0xBA, 0xB7, 0xB0, 0xAD, 0xAA, 0xA7, 0xA0,
    0xDD, 0xDA, 0xD7, 0xD0, 0xCD, 0xCA, 0xC7, 0xC0, 0xDD, 0xDA, 0xD7, 0xD0, 0xCD, 0xCA, 0xC7, 0xC0
};

uint8_t calculate_checksum(const uint8_t *data, uint16_t length) {
    uint8_t crc = 0x00;
    for (uint16_t i = 0; i < length; i++) {
        crc = crc8_table[crc ^ data[i]];
    }
    return crc;
}

// ── 串口初始化 ──
bool pico_lvgl_init(const char *port_name) {
    if (connected) {
        fprintf(stderr, "Already connected to Pico\n");
        return true;
    }
    
    // 打开串口
    serial_port = open(port_name, O_RDWR | O_NOCTTY | O_NDELAY);
    if (serial_port < 0) {
        fprintf(stderr, "Error opening serial port %s: %s\n", port_name, strerror(errno));
        return false;
    }
    
    // 配置串口
    struct termios options;
    tcgetattr(serial_port, &options);
    
    // 设置波特率
    cfsetispeed(&options, B115200);
    cfsetospeed(&options, B115200);
    
    // 8N1配置
    options.c_cflag &= ~PARENB;   // 无奇偶校验
    options.c_cflag &= ~CSTOPB;   // 1位停止位
    options.c_cflag &= ~CSIZE;   // 清除数据位设置
    options.c_cflag |= CS8;      // 8位数据
    
    // 启用接收
    options.c_cflag |= (CLOCAL | CREAD);
    
    // 禁用流控
    options.c_cflag &= ~CRTSCTS;
    
    // 原始输入模式
    options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
    
    // 禁用软件流控
    options.c_iflag &= ~(IXON | IXOFF | IXANY);
    
    // 原始输出模式
    options.c_oflag &= ~OPOST;
    
    // 设置超时 - 100ms
    options.c_cc[VMIN] = 0;
    options.c_cc[VTIME] = 1;
    
    tcsetattr(serial_port, TCSANOW, &options);
    
    connected = true;
    printf("Connected to Pico on %s\n", port_name);
    
    return true;
}

void pico_lvgl_cleanup(void) {
    if (serial_port >= 0) {
        close(serial_port);
        serial_port = -1;
    }
    connected = false;
    printf("Disconnected from Pico\n");
}

// ── 数据发送 ──
bool pico_lvgl_send_packet(const PicoLvglPacket *packet) {
    if (!connected || serial_port < 0) {
        fprintf(stderr, "Not connected to Pico\n");
        return false;
    }
    
    uint8_t buffer[sizeof(PicoLvglPacket)];
    memcpy(buffer, packet, sizeof(PicoLvglPacket));
    
    // 发送数据
    ssize_t bytes_written = write(serial_port, buffer, sizeof(PicoLvglPacket));
    if (bytes_written != sizeof(PicoLvglPacket)) {
        fprintf(stderr, "Error sending packet: %s\n", strerror(errno));
        return false;
    }
    
    bytes_sent += bytes_written;
    return true;
}

bool pico_lvgl_send_config(const PicoLvglConfig *config) {
    PicoLvglPacket packet;
    packet.magic = PICO_LVGL_HEADER_MAGIC;
    packet.type = PICO_LVGL_DATA_CONFIG;
    packet.length = sizeof(PicoLvglConfig);
    memcpy(packet.data, config, sizeof(PicoLvglConfig));
    packet.checksum = calculate_checksum(packet.data, packet.length);
    
    return pico_lvgl_send_packet(&packet);
}

bool pico_lvgl_send_frame(const uint8_t *framebuffer, uint16_t x, uint16_t y, 
                         uint16_t width, uint16_t height, uint8_t format) {
    PicoLvglFrameHeader header;
    header.x = x;
    header.y = y;
    header.width = width;
    header.height = height;
    header.format = format;
    header.compression = 0; // 暂时不压缩
    
    uint16_t header_size = sizeof(PicoLvglFrameHeader);
    uint16_t total_length = header_size + (width * height * 3); // RGB888
    
    if (total_length > PICO_LVGL_MAX_PACKET) {
        fprintf(stderr, "Frame data too large\n");
        return false;
    }
    
    PicoLvglPacket packet;
    packet.magic = PICO_LVGL_HEADER_MAGIC;
    packet.type = PICO_LVGL_DATA_FRAMEBUFFER;
    packet.length = total_length;
    
    // 复制帧头
    memcpy(packet.data, &header, header_size);
    
    // 复制像素数据
    memcpy(&packet.data[header_size], framebuffer, width * height * 3);
    
    packet.checksum = calculate_checksum(packet.data, packet.length);
    
    return pico_lvgl_send_packet(&packet);
}

bool pico_lvgl_send_status(const PicoLvglStatusInfo *status) {
    PicoLvglPacket packet;
    packet.magic = PICO_LVGL_HEADER_MAGIC;
    packet.type = PICO_LVGL_DATA_STATUS;
    packet.length = sizeof(PicoLvglStatusInfo);
    memcpy(packet.data, status, sizeof(PicoLvglStatusInfo));
    packet.checksum = calculate_checksum(packet.data, packet.length);
    
    return pico_lvgl_send_packet(&packet);
}

bool pico_lvgl_send_command(uint8_t cmd, uint8_t param) {
    PicoLvglControl control;
    control.command = cmd;
    control.parameter = param;
    control.reserved = 0;
    
    PicoLvglPacket packet;
    packet.magic = PICO_LVGL_HEADER_MAGIC;
    packet.type = PICO_LVGL_DATA_CONTROL;
    packet.length = sizeof(PicoLvglControl);
    memcpy(packet.data, &control, sizeof(PicoLvglControl));
    packet.checksum = calculate_checksum(packet.data, packet.length);
    
    return pico_lvgl_send_packet(&packet);
}

// ── 数据接收 ──
bool pico_lvgl_receive_packet(PicoLvglPacket *packet) {
    if (!connected || serial_port < 0) {
        return false;
    }
    
    // 读取魔术字
    uint16_t magic;
    ssize_t bytes_read = read(serial_port, &magic, 2);
    if (bytes_read != 2) {
        return false;
    }
    
    if (magic != PICO_LVGL_HEADER_MAGIC) {
        fprintf(stderr, "Invalid magic header: 0x%04X\n", magic);
        return false;
    }
    
    // 读取类型和长度
    uint8_t type_and_length[3];
    bytes_read = read(serial_port, type_and_length, 3);
    if (bytes_read != 3) {
        return false;
    }
    
    packet->type = type_and_length[0];
    packet->length = (type_and_length[1] << 8) | type_and_length[2];
    
    if (packet->length > PICO_LVGL_MAX_PACKET) {
        fprintf(stderr, "Packet too large: %d\n", packet->length);
        return false;
    }
    
    // 读取数据
    bytes_read = read(serial_port, packet->data, packet->length);
    if (bytes_read != packet->length) {
        return false;
    }
    
    // 读取校验
    uint8_t checksum;
    bytes_read = read(serial_port, &checksum, 1);
    if (bytes_read != 1) {
        return false;
    }
    
    packet->checksum = checksum;
    packet->magic = magic;
    bytes_received += (2 + 3 + packet->length + 1);
    
    return true;
}

bool pico_lvgl_wait_for_ack(uint32_t timeout_ms) {
    struct timeval start, current;
    gettimeofday(&start, NULL);
    
    while (1) {
        PicoLvglPacket packet;
        if (pico_lvgl_receive_packet(&packet)) {
            if (packet.type == PICO_LVGL_DATA_ACK) {
                return true;
            } else if (packet.type == PICO_LVGL_DATA_NACK) {
                fprintf(stderr, "NACK received, error: %d\n", packet.data[0]);
                return false;
            }
        }
        
        gettimeofday(&current, NULL);
        uint64_t elapsed = (current.tv_sec - start.tv_sec) * 1000 + 
                          (current.tv_usec - start.tv_usec) / 1000;
        if (elapsed > timeout_ms) {
            return false;
        }
        
        usleep(1000); // 1ms delay
    }
}

// ── 数据处理 ──
bool validate_packet(const PicoLvglPacket *packet) {
    if (packet->magic != PICO_LVGL_HEADER_MAGIC) {
        return false;
    }
    
    uint8_t calculated_crc = calculate_checksum(packet->data, packet->length);
    return calculated_crc == packet->checksum;
}

void packet_to_screen_data(const PicoLvglPacket *packet) {
    switch (packet->type) {
        case PICO_LVGL_DATA_FRAMEBUFFER: {
            PicoLvglFrameHeader *header = (PicoLvglFrameHeader*)packet->data;
            printf("Received frame: x=%d, y=%d, w=%d, h=%d, format=%d\n", 
                   header->x, header->y, header->width, header->height, header->format);
            break;
        }
            
        case PICO_LVGL_DATA_CONFIG: {
            PicoLvglConfig *config = (PicoLvglConfig*)packet->data;
            printf("Screen config: %dx%d, orientation=%d, depth=%d\n", 
                   config->width, config->height, config->orientation, config->color_depth);
            break;
        }
            
        case PICO_LVGL_DATA_STATUS: {
            PicoLvglStatusInfo *status = (PicoLvglStatusInfo*)packet->data;
            printf("Pico status: cpu=%d%%, fps=%d, frames=%d\n", 
                   status->cpu_usage, status->current_fps, status->frame_count);
            break;
        }
            
        default:
            printf("Unknown packet type: %d\n", packet->type);
            break;
    }
}

// ── 状态查询 ──
bool pico_lvgl_is_connected(void) {
    return connected;
}

uint32_t pico_lvgl_get_bytes_sent(void) {
    return bytes_sent;
}

uint32_t pico_lvgl_get_bytes_received(void) {
    return bytes_received;
}

// ── 辅助函数 ──
const char* pico_lvgl_data_type_to_string(PicoLvglDataType type) {
    switch (type) {
        case PICO_LVGL_DATA_FRAMEBUFFER: return "FRAMEBUFFER";
        case PICO_LVGL_DATA_CONFIG: return "CONFIG";
        case PICO_LVGL_DATA_STATUS: return "STATUS";
        case PICO_LVGL_DATA_CONTROL: return "CONTROL";
        case PICO_LVGL_DATA_ACK: return "ACK";
        case PICO_LVGL_DATA_NACK: return "NACK";
        default: return "UNKNOWN";
    }
}

const char* pico_lvgl_status_to_string(uint8_t status) {
    switch (status) {
        case PICO_STATUS_OK: return "OK";
        case PICO_STATUS_ERROR: return "ERROR";
        case PICO_STATUS_BUSY: return "BUSY";
        case PICO_STATUS_TIMEOUT: return "TIMEOUT";
        case PICO_STATUS_MEMORY_ERROR: return "MEMORY_ERROR";
        case PICO_STATUS_COMM_ERROR: return "COMM_ERROR";
        default: return "UNKNOWN";
    }
}
