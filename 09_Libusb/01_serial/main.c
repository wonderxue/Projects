#include "libusb.h"
#include "stdio.h"

int get_devices_serial_data()
{
	libusb_context * ctx;
	int ret=libusb_init(&ctx);
	if(ret !=0)
	{
		fprintf(stderr,"failed to init: %d\n",ret);
		return -1;
	}
	libusb_set_debug(ctx,3);
	libusb_device **devlist=NULL;
	ssize_t count=libusb_get_device_list(ctx,&devlist);
	if (count < 0)
	{
		fprintf(stderr,"failed to get list: %zd\n",count);
		libusb_exit(ctx);
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
			libusb_free_device_list(devlist,1);
			libusb_exit(ctx);
			return -1;
		}
		fprintf(stdout,"VID: %04x PID: %04x\n",desc.idVendor,desc.idProduct);
	}
	libusb_free_device_list(devlist,1);
	libusb_device_handle *devhdl = libusb_open_device_with_vid_pid(ctx,0x1a86,0x7523);
	if(devhdl == NULL)
	{
		fprintf(stderr,"open dev failed\n");
		libusb_exit(ctx);
		return -1;
	}
	ret=libusb_claim_interface(devhdl,0);
	if(ret<0)
	{
		fprintf(stderr,"claim dev interface failed\n");
		libusb_exit(ctx);
		return -1;
	}
	ret=libusb_reset_device(devhdl);
	if(ret<0)
	{
		fprintf(stderr,"reset dev failed\n");
		libusb_exit(ctx);
		return -1;
	}
	uint8_t buf[100]={0};
	buf[99]='\n';
	int cnt=0;
	ret=libusb_bulk_transfer(devhdl,0x82,buf,sizeof(buf),&cnt,1000);
	fprintf(stderr,"get buf failed: %d\n",ret);
	fprintf(stdout,"data len: %d data buf: %s\n",cnt,buf);
	libusb_release_interface(devhdl,0);
	libusb_close(devhdl);
	libusb_exit(ctx);
	return 1;
}

int main()
{
	return get_devices_serial_data();
}