/*
 * SPDX-FileCopyrightText: 2010-2022 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: CC0-1.0
 */

#include <stdio.h>
#include <inttypes.h>
#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_chip_info.h"
#include "esp_system.h"
#include "usbd_core.h"
#include "usbh_core.h"
#include "demo/cdc_acm_template.c"
#include "vfs_port.h"

extern void cdc_acm_init1(uint8_t busid, uintptr_t reg_base);
int abc=0x40;
void app_main(void)
{
    USB_LOG_INFO("Hello CherryUSB!%d\n",abc++);

    cdc_acm_init1(0, 0x60080000);
    register_usbconsole_vfs();
    FILE* console=fopen("/usbconsole0","w");
    vTaskDelay(1000);
    uint8_t a[]={'1','\n','2'};
    // fwrite("mdfuck\n",1,8,console);
    while(1)
    {
        vTaskDelay(100/portTICK_PERIOD_MS);
        USB_LOG_INFO("Hello CherryUSB!%d\n",abc++);
        extern void cdc_acm_data_send_with_dtr_test(uint8_t busid);
        // cdc_acm_data_send_with_dtr_test(0);
        fwrite("yyyyy\n",1,7,console);
        fflush(console);
    }
}