cmake_minimum_required(VERSION 3.13)

set(PICOTOOL_FETCH_FROM_GIT_PATH "/Users/wonderxue/Desktop/ToolChains/PICO/picotool")
set(PICO_SDK_PATH "$ENV{HOME}/Desktop/SDKs/PICO/pico-sdk")   # 不要用 ~，CMake 不展开
set(PICO_TOOLCHAIN_PATH "$ENV{HOME}/Desktop/ToolChains/ARM/arm-gnu-toolchain-14.2.rel1-darwin-arm64-arm-none-eabi/bin")

include(pico_sdk_import.cmake)

project(test_project C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

set(LVGL_DIR "/Users/wonderxue/Desktop/SDKs/3rd_party/lvgl/lvgl")

file(GLOB_RECURSE LVGL_SOURCES "${LVGL_DIR}/src/*.c")

add_executable(pico_usb_sender
    main.c
    ${LVGL_SOURCES}
)


target_include_directories(pico_usb_sender PRIVATE
    ${SDL3_INCLUDE_DIR}
    ${LVGL_DIR}                         # for #include "lvgl.h"
    ${LVGL_DIR}/src                     # for internal LVGL includes
    ${CMAKE_CURRENT_SOURCE_DIR}         # for lv_conf.h
)
# 启用 USB stdio（printf 走 USB CDC）
pico_enable_stdio_usb(pico_usb_sender 1)
pico_enable_stdio_uart(pico_usb_sender 0)   # 关掉 UART，避免冲突

target_compile_options(pico_usb_sender PRIVATE
    -Wall -Wextra -O2
)

target_link_libraries(pico_usb_sender
    pico_stdlib
    pico_stdio_usb
    tinyusb_device      # 必须链接
    hardware_usb
    m
)

