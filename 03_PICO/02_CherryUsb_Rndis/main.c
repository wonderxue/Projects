#include <stdio.h>
#include <stdint.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "hardware/irq.h"
#include "lwip/netif.h"
#include "lwip/pbuf.h"
#include "lwip/tcp.h"
#include "lwip/ip_addr.h"

struct name
{
	/* data */
	int length;
	char bytes[20];
};

extern void cdc_rndis_init(uint8_t busid, uintptr_t reg_base);
extern void cdc_ecm_init(uint8_t busid, uintptr_t reg_base);
extern void hid_mouse_test(uint8_t busid);
uint32_t timer=0;
extern void rndis_input_poll(void);
extern void cdc_ecm_input_poll(void);
err_t tcp_client_recv(void *arg,struct tcp_pcb *pcb,struct pbuf *tcp_recv_pbuf, err_t err)
{
	struct pbuf *tcp_send_pbuf;
    struct name *name = (struct name *)arg;

    if (tcp_recv_pbuf != NULL)
    {
    /* 扩大收发数据的窗口 */
        tcp_recved(pcb, tcp_recv_pbuf->tot_len);

        if (!name)
        {
                        pbuf_free(tcp_recv_pbuf);
                        return ERR_ARG;
        }

                /* 将接收的数据拷贝给发送结构体 */
                tcp_send_pbuf = tcp_recv_pbuf;
				tcp_write(pcb,tcp_send_pbuf->payload,tcp_send_pbuf->len,1);
	}
	return ERR_OK;
}
err_t tcp_connect_cb(void *arg, struct tcp_pcb *pcb,err_t err)
{
	tcp_arg(pcb,mem_calloc(sizeof(struct name),1));
	tcp_write(pcb,"hello",6,0);
	tcp_recv(pcb,tcp_client_recv);
	return ERR_OK;
}
int main() {
	// stdio_init_all();
	gpio_init(25);
	gpio_set_dir(25,GPIO_OUT);
	cdc_ecm_init(0, 0);
	struct tcp_pcb* tcp=tcp_new();
	ip_addr_t ip=IPADDR4_INIT_BYTES(192,168,7,1);

	tcp_bind(tcp,IP_ADDR_ANY,80);
	tcp_connect(tcp,&ip,80,tcp_connect_cb);
	// gpio_put(25,1);
	
	while (1)
	{
		/* code */
		// hid_mouse_test(0);
		cdc_ecm_input_poll();
		extern void sys_check_timeouts();
		sys_check_timeouts();
		sleep_us(800);

		timer++;
	}
	
}
uint32_t sys_now()
{
	return timer;
}
void gpio()
{
	gpio_put(25,1);
}
void gpio_led_toggle()
{
	static int i=0;
	i++;
	if(i==10000)
	{
		// gpio_put(25,0);
	}
	if(i==20000)
	{
		// gpio_put(25,1);
		i=0;
	}
}