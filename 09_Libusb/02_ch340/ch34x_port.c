#include "ch34x_port.h"
#include "assert.h"

#define CH34X_CTRL_IN (LIBUSB_REQUEST_TYPE_VENDOR | LIBUSB_ENDPOINT_IN)
#define CH34X_CTRL_OUT (LIBUSB_REQUEST_TYPE_VENDOR | LIBUSB_ENDPOINT_OUT)

#define CH34X_DATA_IN (0x2 | LIBUSB_ENDPOINT_IN)
#define CH34X_DATA_OUT (0x2 | LIBUSB_ENDPOINT_OUT)

#define CH34X_REQ_READ_VERSION 0x5F
#define CH34X_REQ_READ_REG 0x95
#define CH34X_REQ_WRITE_REG 0x9A
#define CH34X_REQ_SERIAL_INIT 0xA1
#define CH34X_REQ_MODEM_CTRL 0xA4

#define CH34X_REG_BREAK 0x05
#define CH34X_REG_LCR 0x18
#define CH34X_NBREAK_BITS 0x01

#define CH34X_LCR_ENABLE_RX 0x80
#define CH34X_LCR_ENABLE_TX 0x40

#define CH34X_LCR_MARK_SPACE 0x20
#define CH34X_LCR_PAR_EVEN 0x10
#define CH34X_LCR_ENABLE_PAR 0x08

#define CH34X_LCR_STOP_BITS_1 0x00
#define CH34X_LCR_STOP_BITS_1P5 0x02
#define CH34X_LCR_STOP_BITS_2 0x04

#define CH34X_LCR_CS8 0x03
#define CH34X_LCR_CS7 0x02
#define CH34X_LCR_CS6 0x01
#define CH34X_LCR_CS5 0x00

#define CH34X_BAUDBASE_FACTOR 1532620800
#define CH34X_BAUDBASE_DIVMAX 3

typedef struct
{
  uint8_t parity;
  uint8_t stopBits;
  uint8_t dataBits;
} ch34x_lcrcfg_st;

static libusb_device_handle *handle;
static uint32_t currentBaudRate = 0;
static serial_parity_en currentParity = UndefParity;
static serial_stopbits_en currentStopBits = StopBits_Undef;
static serial_databits_en currentDataBits = DataBits_Undef;
static ch34x_lcrcfg_st currentLcrCfg = {0, 0, CH34X_LCR_CS8};

static int initialDrv(libusb_device_handle *handle)
{
  handle = handle;
}

static int setLcr()
{
  uint8_t lcr = CH34X_LCR_ENABLE_TX | CH34X_LCR_ENABLE_RX;
  lcr |= currentLcrCfg.dataBits;
  lcr |= currentLcrCfg.parity;
  lcr |= currentLcrCfg.stopBits;
  int ret = libusb_control_transfer(handle, CH34X_CTRL_OUT, CH34X_REQ_WRITE_REG,
                                    0x2518, lcr, NULL, 0, CH34X_TIMEOUT);
  ASSERT(ret>0,ret,"The contral transfer failed");
  return 0;
}

static int setBaudRate(uint32_t baudRate)
{
  if (currentBaudRate != baudRate)
  {
    uint32_t factor = (CH34X_BAUDBASE_FACTOR / baudRate);
    uint32_t divisor = CH34X_BAUDBASE_DIVMAX;
    while ((factor > 0xfff0) && divisor)
    {
      factor >>= 3;
      divisor--;
    }
    ASSERT(factor > 0xfff0,factor,"The factor is invalid");

    factor = 0x10000 - factor;
    uint16_t a = (factor & 0xff00) | divisor;
    a |= (1 << 7);

    int ret = libusb_control_transfer(handle, CH34X_CTRL_OUT, CH34X_REQ_WRITE_REG,
                                      0x1312, a, NULL, 0, CH34X_TIMEOUT);
    ASSERT(ret<0,ret,"The config of BaudRate failed");
    currentBaudRate = baudRate;
  }
  return 0;
}

static int setParity(serial_parity_en parity)
{
  uint8_t _parity = 0;
  if (currentParity != parity)
  {
    switch (parity)
    {
    case NoParity:
      _parity = 0;
      break;
    case EvenParity:
      _parity = CH34X_LCR_ENABLE_PAR | CH34X_LCR_PAR_EVEN;
      break;
    case OddParity:
      _parity = CH34X_LCR_ENABLE_PAR;
      break;
    case MarkParity:
      _parity = CH34X_LCR_ENABLE_PAR | CH34X_LCR_MARK_SPACE;
      break;
    case SpaceParity:
      _parity =
          CH34X_LCR_ENABLE_PAR | CH34X_LCR_MARK_SPACE | CH34X_LCR_PAR_EVEN;
      break;
    default:
      ASSERT(0,parity,"No such Parity");
      break;
    }
    uint8_t old = currentLcrCfg.parity;
    currentLcrCfg.parity = _parity;
    int ret = setLcr();
    ASSERT(ret<0,ret,"The config of Parity failed",{currentLcrCfg.parity = old;});
    currentParity = parity;
  }
  return 0;
}

static int setDataBits(serial_databits_en dataBits)
{
  u_int8_t _dataBits = 0;
  if (currentDataBits != dataBits)
  {
    switch (dataBits)
    {
    case DataBits_5:
      _dataBits = CH34X_LCR_CS5;
      break;
    case DataBits_6:
      _dataBits = CH34X_LCR_CS6;
      break;
    case DataBits_7:
      _dataBits = CH34X_LCR_CS7;
      break;
    case DataBits_8:
      _dataBits = CH34X_LCR_CS8;
      break;
    default:
      ASSERT(0,dataBits,"No such DataBits");
      break;
    }
    uint8_t old = currentLcrCfg.dataBits;
    currentLcrCfg.dataBits = _dataBits;
    int ret = setLcr();
    ASSERT(ret<0,ret,"The config of DataBits failed",{currentLcrCfg.dataBits = old;});
    currentDataBits = dataBits;
  }
  return 0;
}

static int setStopBits(serial_stopbits_en stopBits)
{
  uint8_t _stopBits = 0;
  if (currentStopBits != stopBits)
  {
    switch (stopBits)
    {
    case StopBits_One:
      _stopBits = 0;
      break;
    case StopBits_OneAndHalf:
      _stopBits = CH34X_LCR_STOP_BITS_1P5;
      break;
    case StopBits_Two:
      _stopBits = CH34X_LCR_STOP_BITS_2;
      break;
    default:
      ASSERT(0,stopBits,"No such StopBits");
      break;
    }
    uint8_t old = currentLcrCfg.stopBits;
    currentLcrCfg.stopBits = _stopBits;
    int ret = setLcr();
    ASSERT(ret<0,ret,"The config of DataBits failed",{currentLcrCfg.stopBits = old;});
    currentStopBits = stopBits;
  }
  return 0;
}

serial_drv_st ch34x =
    {
        .initialDrv = initialDrv,
        .setBaudRate = setBaudRate,
        .setDataBits = setDataBits,
        .setParity = setParity,
        .setStopBits = setStopBits};