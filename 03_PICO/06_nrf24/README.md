# Pico nRF24L01+ 通信框架

## 硬件连接

### nRF24L01+ 引脚说明
nRF24L01+ 没有专门的复位引脚，通过 CE 引脚控制工作状态。

### Pico 到 nRF24L01+ 连接
```
Pico GPIO    ->  nRF24L01+
-----------------------------
3 (MOSI)     ->  MOSI
4 (MISO)     ->  MISO  
2 (SCK)      ->  SCK
26 (CS)      ->  CSN
15 (CE)      ->  CE
14 (IRQ)     ->  IRQ (可选，但推荐)
```

### 电源连接
```
Pico 3.3V    ->  VCC
Pico GND     ->  GND
```

## 代码特点

1. **正确的引脚配置**：移除了不存在的复位引脚
2. **完整的错误处理**：包括发送成功、数据包过长、ACK超时等
3. **每秒发送消息**：自动递增计数器
4. **基于RadioLib库**：提供稳定的nRF24通信

## 使用方法

1. 将编译生成的 `pico-nrf24.uf2` 文件复制到 Pico 板
2. 连接硬件引脚
3. 通过串口监视器查看发送状态

## 引脚定义
- **SPI_PORT**: spi0
- **SPI_MISO**: 4
- **SPI_MOSI**: 3  
- **SPI_SCK**: 2
- **RFM_NSS**: 26 (CS)
- **RFM_CE**: 15 (CE)
- **RFM_IRQ**: 14 (IRQ)
