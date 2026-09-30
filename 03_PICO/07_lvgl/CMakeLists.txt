cmake_minimum_required(VERSION 3.13)
set(PICOTOOL_FETCH_FROM_GIT_PATH "/Users/wonderxue/Desktop/ToolChains/PICO/picotool")
set(PICO_SDK_PATH "~/Desktop/SDKs/PICO/pico-sdk")
set(PICO_TOOLCHAIN_PATH "~/Desktop/ToolChains/ARM/arm-gnu-toolchain-14.2.rel1-darwin-arm64-arm-none-eabi/bin")
set(PICO_PLATFORM "rp2040")
include(pico_sdk_import.cmake)
project(test_project C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
pico_sdk_init()
add_executable(PICO
main.c
)

pico_enable_stdio_usb(PICO 1)
pico_enable_stdio_uart(PICO 1)
pico_add_extra_outputs(PICO)
target_link_libraries(PICO pico_stdlib)
target_link_libraries(PICO
    pico_stdlib
)