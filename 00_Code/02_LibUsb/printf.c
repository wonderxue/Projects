#include <stdio.h>

#include "libusb.h"

int main(void)
{
	int res=0;
	int cnt=0;
	libusb_device **devs;
	libusb_device *dev;
	res=libusb_init(NULL);
	cnt=libusb_get_device_list(NULL,&devs);
	printf("num =%d\n",cnt);
	dev=*(devs+1);
	libusb_device_handle **h;
	// int fd=libusb_open(dev,h);
	printf("num=%d",cnt);
	struct libusb_config_descriptor *cfg;

	
	cnt=libusb_get_config_descriptor(dev,0,&cfg);
	printf("num=%d\n",cnt);
	printf("%s,",&cfg->bDescriptorType);
	return 0;
}