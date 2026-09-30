#include "esp_vfs.h"
#include "usbd_core.h"
typedef struct
{
	uint8_t port;
}usbconsole_ctx;

static int usbconsole_stat(void *ctx, const char *path, struct stat *st)
{
	return 0;
}

static ssize_t usbconsole_write(void *ctx, int fd, const void *data, size_t size)
{
	extern volatile uint8_t dtr_enable ;
	extern volatile bool  ep_tx_busy_flag;
	uint8_t ptr[100];
	for(int i=0;i<size;i++)
	{
		ptr[i]=*((const uint8_t *)data+i);
	}
	
	if(size>3)
	{
		size=3;
	}
	if (dtr_enable) {
        ep_tx_busy_flag = true;
		uint8_t a[]={'0','\n','2'};
		a[0]+=size;
        usbd_ep_start_write(0, 0x81, ptr, size);
        while (ep_tx_busy_flag)
		{
			/* code */
		}
		
    }
	return size;
}

static int usbconsole_open(void *ctx, const char *path, int flags, int mode)
{
	return 0;
}
static int usbconsole_close(void *ctx, int fd)
{
	return 0;
}
static ssize_t usbconsole_read(void *ctx, int fd, void *dst, size_t size)
{
	return 0;
}

// esp_vfs_fs_ops_t 及其子组件的声明必须是静态的
static const esp_vfs_dir_ops_t usbconsole_dir = {
    .stat_p = &usbconsole_stat,
};

static const esp_vfs_fs_ops_t usbconsole = {
    .write_p = &usbconsole_write,
    .open_p = &usbconsole_open,
    .close_p = &usbconsole_close,
    .read_p = &usbconsole_read,
    .dir = &usbconsole_dir,
};

int register_usbconsole_vfs()
{
	usbconsole_ctx usbconsole0={.port=0};
	usbconsole_ctx usbconsole1={.port=1};
	esp_vfs_register_fs("/usbconsole0", &usbconsole, ESP_VFS_FLAG_STATIC|ESP_VFS_FLAG_CONTEXT_PTR, &usbconsole0);
	esp_vfs_register_fs("/usbconsole0", &usbconsole, ESP_VFS_FLAG_STATIC|ESP_VFS_FLAG_CONTEXT_PTR, &usbconsole1);
	return 0;
}
