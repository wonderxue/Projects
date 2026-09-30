#pragma once
#include "usb_drv.h"

typedef enum
{
	NoParity = 0u,
	EvenParity,
	OddParity,
	MarkParity,
	SpaceParity,
	UndefParity,
}serial_parity_en;

typedef enum
{
	StopBits_Undef = 0u,
	StopBits_One,
	StopBits_OneAndHalf,
	StopBits_Two,
}serial_stopbits_en;

typedef enum
{
	DataBits_Undef = 0u,
	DataBits_5 = 5u,
	DataBits_6,
	DataBits_7,
	DataBits_8,
}serial_databits_en;

typedef struct 
{
	int (*initialDrv)(libusb_device_handle *handle);
	int (*setBaudRate)(uint32_t baudRate);
	int (*setDataBits)(serial_databits_en dataBits);
	int (*setParity)(serial_parity_en parity);
	int (*setStopBits)(serial_stopbits_en stopBits);

}serial_drv_st;
