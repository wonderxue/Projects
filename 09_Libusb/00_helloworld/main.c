#include "libusb.h"
#include "stdio.h"

int get_devices_list()
{
	int ret=libusb_init(NULL);
	if(ret !=0)
	{
		fprintf(stderr,"failed to init: %d\n",ret);
		return -1;
	}
	libusb_device **devlist=NULL;
	ssize_t count=libusb_get_device_list(NULL,&devlist);
	if (count < 0)
	{
		fprintf(stderr,"failed to get list: %zd\n",count);
		libusb_exit(NULL);
		return -1;
	}
	libusb_device *dev = NULL;
	int i=0;
	while ((dev=devlist[i++])!=NULL)
	{
		/* code */
		struct libusb_device_descriptor desc;
		ret = libusb_get_device_descriptor(dev,&desc);
		if(ret<0)
		{
			fprintf(stderr,"failed to get descriptor: %d\n",ret);
			return -1;
		}
		fprintf(stdout,"VID: %04x PID: %04x\n",desc.idVendor,desc.idProduct);
	}
	
}

int main()
{
	return get_devices_list();
}