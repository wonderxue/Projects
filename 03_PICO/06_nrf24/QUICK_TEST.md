# Pico nRF24L01+ 快速测试指南

## 🎯 问题解决

**问题**：transmit和receive程序缺少USB初始化延迟，导致串口设备可见但无输出

**解决**：已添加3秒USB CDC初始化延迟

## ✅ 修复内容

### Transmit 程序
```cpp
int main() {
    // Initialize USB CDC (virtual serial port)
    stdio_init_all();
    
    // 关键：等待USB就绪
    sleep_ms(3000);  // 3秒延迟确保USB CDC就绪
    
    print_message("nRF24", "Starting nRF24L01+ transmitter...");
    print_message("SYS", "USB CDC initialized");
    // ...
}
```

### Receive 程序
```cpp
int main() {
    // Initialize USB CDC (virtual serial port)
    stdio_init_all();
    
    // 关键：等待USB就绪
    sleep_ms(3000);  // 3秒延迟确保USB CDC就绪
    
    print_message("nRF24", "Starting nRF24L01+ receiver...");
    print_message("SYS", "USB CDC initialized");
    // ...
}
```

## 📱 可用固件

### 1. 发送模式
- **文件**: `build/pico-nrf24_transmit.uf2`
- **功能**: 每秒发送 "Hello World! #0", "Hello World! #1", ...
- **预期输出**:
```bash
[nRF24] Starting nRF24L01+ transmitter...
[SYS] USB CDC initialized
[nRF24] Initializing radio...
[nRF24] Radio initialized successfully!
[nRF24] Setting transmit pipe...
[nRF24] Transmit pipe configured!
[nRF24] Starting transmission loop...
[nRF24] You should see messages every second
[nRF24] Transmitting packet...
[nRF24] Success!
```

### 2. 接收模式
- **文件**: `build/pico-nrf24_receive.uf2`
- **功能**: 监听并接收来自发送端的数据
- **预期输出**:
```bash
[nRF24] Starting nRF24L01+ receiver...
[SYS] USB CDC initialized
[nRF24] Initializing radio...
[nRF24] Radio initialized successfully!
[nRF24] Setting receive pipe...
[nRF24] Receive pipe configured!
[nRF24] Starting to listen...
[nRF24] Waiting for transmission...
[nRF24] Received packet:
  Data: 'Hello World! #0'
```

## 🔧 使用步骤

### 1. 烧录固件
```bash
# 发送模式
cp build/pico-nrf24_transmit.uf2 /Volumes/RPI-RP2/

# 或接收模式
cp build/pico-nrf24_receive.uf2 /Volumes/RPI-RP2/
```

### 2. 连接硬件
按照 USAGE.md 中的引脚连接图连接 nRF24L01+

### 3. 打开串口监视器
- **工具**: Terminal、PuTTY、Arduino IDE串口监视器等
- **波特率**: 115200
- **数据位**: 8
- **停止位**: 1
- **校验位**: 无

### 4. 观察输出
- 等待3秒后应该看到初始化消息
- 发送模式每秒发送消息
- 接收模式在收到数据时显示

## 🚨 故障排除

### 仍然看不到输出？
1. **检查波特率**: 确保设置为115200
2. **等待3秒**: 程序启动后会等待3秒让USB就绪
3. **重启设备**: 断开USB重新连接
4. **检查连接**: 确保nRF24L01+正确连接

### 设备管理器看不到串口？
- 检查USB线缆
- 尝试不同的USB端口
- 检查Pico是否正确识别

## ✅ 验证结果
```bash
$ picotool info build/pico-nrf24_transmit.elf
features: USB stdin / stdout  # ✅ USB功能正常

$ picotool info build/pico-nrf24_receive.elf  
features: USB stdin / stdout  # ✅ USB功能正常
```

现在transmit和receive程序都应该能正常显示串口输出了！
