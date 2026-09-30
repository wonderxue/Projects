cmake_minimum_required(VERSION 3.13)
set(PICOTOOL_FETCH_FROM_GIT_PATH "/Users/wonderxue/Desktop/ToolChains/PICO/picotool")
set(PICO_SDK_PATH "~/Desktop/SDKs/PICO/pico-sdk")
set(PICO_TOOLCHAIN_PATH "~/Desktop/ToolChains/ARM/arm-gnu-toolchain-14.2.rel1-darwin-arm64-arm-none-eabi/bin")
set(PICO_PLATFORM "rp2350")
include(pico_sdk_import.cmake)
project(test_project C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
pico_sdk_init()
include_directories(
	cherryusb/common 
	cherryusb/core
	cherryusb/class/wireless
	cherryusb/class/cdc
	cherryusb/third_party/dhcp-server
	cherryusb/third_party/dns-server
	lwip/src/include
	port

	)
file(GLOB source 
	lwip/src/api/*.c 
	lwip/src/core/*.c 
	lwip/src/core/ipv4/*.c
	lwip/src/netif/*.c
	)

add_executable(cherryusb
	# app/cdc_rndis_template.c
	app/cdc_ecm_template.c
	cherryusb/core/usbd_core.c
	cherryusb/class/hid/usbd_hid.c
	cherryusb/class/wireless/usbd_rndis.c
	cherryusb/class/cdc/usbd_cdc_ecm.c
	cherryusb/third_party/dhcp-server/dhserver.c
	cherryusb/third_party/dns-server/dnserver.c
	port/usb_dc_rp2040.c
	main.c
)

target_sources(cherryusb PUBLIC ${source})

pico_add_extra_outputs(cherryusb)
target_link_libraries(cherryusb pico_stdlib)