# Pico LVGL Data Transfer System

基于Pico LVGL的实时显示数据传输系统，将Pico的LVGL显示内容通过USB发送到电脑并用SimuScreen显示。

## 系统架构

```
Pico (LVGL + USB CDC) ←→ 上位机接收器 ←→ SimuScreen Display
```

### 组件说明

1. **Pico端**:
   - 捕获LVGL帧缓冲区数据
   - 通过USB CDC发送数据
   - 支持实时流传输

2. **上位机接收器**:
   - 接收USB CDC数据
   - 解析数据包
   - 调用SimuScreen显示

3. **SimuScreen显示**:
   - 三种显示风格：像素化、辉光管、AMOLED
   - 实时渲染Pico数据
   - 统一抽象接口

## 快速开始

### 1. 编译接收器

```bash
cd /Users/wonderxue/Desktop/Projects/10_SDL/01_Lvgl/pico_transfer
./quick_start.sh build
```

### 2. 运行接收器

```bash
# 默认配置
./build/lvgl_receiver

# 自定义配置
./build/lvgl_receiver --style glow --width 800 --height 1200

# 查看帮助
./build/lvgl_receiver --help
```

### 3. Pico端配置

1. 将 `pico_sender.c` 复制到您的Pico开发环境
2. 修改Pico代码以适配您的显示配置
3. 编译并刷写到Pico

## 详细配置

### 命令行参数

```bash
./lvgl_receiver [选项]

选项:
  --port PORT         串口设备路径 (默认: /dev/tty.usbmodem1101)
  --style STYLE       显示风格: pixel, glow, amoled (默认: pixel)
  --width WIDTH       屏幕宽度 (默认: 800)
  --height HEIGHT     屏幕高度 (默认: 1200)
  --pixel-size SIZE   像素大小 (默认: 1)
  --margin MARGIN     边距大小 (默认: 0)
  --fps FPS           目标帧率 (默认: 30)
  --compression       启用压缩 (默认: disabled)
  --help              显示帮助信息
```

### 通信协议

#### 数据包格式
```
[魔术字(2B)][类型(1B)][长度(2B)][数据(NB)][校验(1B)]
[0x55, 0xAA][类型][长度][数据...][CRC8]
```

#### 数据类型
- `0x01`: 帧缓冲区数据
- `0x02`: 显示配置
- `0x03`: 状态信息
- `0x04`: 控制命令
- `0x05`: 确认响应
- `0x06`: 错误响应

#### 帧缓冲区数据
```c
struct {
    uint16_t x, y;          // 起始坐标
    uint16_t width, height; // 数据尺寸
    uint8_t format;         // 颜色格式
    uint8_t compression;    // 压缩方式
    uint8_t pixels[];       // RGB像素数据
}
```

## Pico端开发

### 1. 基本结构

```c
#include "pico_sender.c"

int main() {
    // 初始化USB和LVGL
    tusb_init();
    lv_init();
    
    // 创建显示驱动
    lv_display_t *disp = lv_display_create(width, height);
    lv_display_set_flush_cb(disp, disp_flush);
    
    // 创建UI
    create_ui();
    
    // 主循环
    while (1) {
        tud_task();      // USB任务
        lv_timer_handler(); // LVGL任务
    }
}
```

### 2. 数据捕获

```c
void disp_flush(lv_display_t *disp, const lv_area_t *area, uint8_t *px_map) {
    if (streaming_enabled) {
        // 捕获帧数据
        capture_frame_area(area, px_map);
        
        // 发送到电脑
        send_frame_data(area->x1, area->y1, 
                       area->x2 - area->x1 + 1, 
                       area->y2 - area->y1 + 1);
    }
    
    lv_display_flush_ready(disp);
}
```

### 3. 命令处理

```c
void tud_cdc_rx_cb(uint8_t itf) {
    uint8_t buf[64];
    uint32_t count = tud_cdc_read(buf, sizeof(buf));
    
    if (count > 0) {
        process_command(buf, count);
    }
}
```

## 显示风格

### 1. 像素化风格
- 经典LED显示屏效果
- 带网格覆盖
- 蓝色背景

### 2. 辉光管风格
- 真空管发光效果
- 光晕和粒子效果
- 暖色调发光

### 3. AMOLED风格
- 现代AMOLED显示屏
- 纯黑背景
- 高对比度鲜艳色彩

## 性能优化

### 1. 数据压缩
- 启用RLE或LZ4压缩
- 减少传输数据量

### 2. 区域更新
- 仅更新变化区域
- 减少计算量

### 3. 帧率控制
- 动态调整帧率
- 平衡性能和流畅度

## 故障排除

### 1. USB连接问题
```bash
# 检查设备识别
ls /dev/tty.usb*

# 检查USB权限
lsusb | grep Pico
```

### 2. 通信问题
```bash
# 测试串口通信
minicom -D /dev/tty.usbmodem1101 -b 115200

# 检查数据包
wireshark -i usbmon0
```

### 3. 显示问题
```bash
# 检查显示配置
./lvgl_receiver --style pixel --width 800 --height 1200

# 测试不同风格
./lvgl_receiver --style glow
./lvgl_receiver --style amoled
```

## 扩展功能

### 1. 添加新显示风格
```c
void render_custom_style(void) {
    // 自定义渲染逻辑
}
```

### 2. 支持触摸事件
```c
void touch_input_handler(void) {
    // 处理触摸输入
    // 发送到Pico
}
```

### 3. 录制回放
```c
// 录制Pico显示数据
// 回放到本地显示
```

## API参考

### 接收器API
- `pico_lvgl_init()`: 初始化通信
- `pico_lvgl_send_config()`: 发送配置
- `pico_lvgl_send_frame()`: 发送帧数据
- `pico_lvgl_receive_packet()`: 接收数据包

### Pico端API
- `capture_frame_area()`: 捕获帧区域
- `send_frame_data()`: 发送帧数据
- `process_command()`: 处理命令

### 显示API
- `ss_create()`: 创建屏幕模拟器
- `ss_set_pixel()`: 设置像素
- `ss_render()`: 渲染屏幕

## 许可证

本项目基于MIT许可证开源。

## 贡献

欢迎提交Issue和Pull Request！

## 更新日志

### v1.0.0
- 初始版本发布
- 支持LVGL数据捕获
- USB CDC通信
- 三种显示风格
- 完整的Demo程序

---

## 开发团队

**设计**: Codex AI Assistant  
**实现**: 基于SDL3和LVGL  
**平台**: Raspberry Pi Pico + macOS/Linux/Windows  

**版本**: v1.0.0  
**日期**: 2026-09-28  
**许可证**: MIT License
