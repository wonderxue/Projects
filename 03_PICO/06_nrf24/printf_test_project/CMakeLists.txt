cmake_minimum_required(VERSION 3.18)

set(PICO_SDK_PATH "~/Desktop/SDKs/PICO/pico-sdk")
set(PICO_TOOLCHAIN_PATH "~/Desktop/ToolChains/ARM/arm-gnu-toolchain-14.2.rel1-darwin-arm64-arm-none-eabi/bin")
include(pico_sdk_import.cmake)
project(pico-printf-test C CXX ASM)
pico_sdk_init()

add_executable(${PROJECT_NAME}
    main.cpp
)

# Enable USB CDC (serial) output for printf
pico_enable_stdio_usb(${PROJECT_NAME} 1)
pico_enable_stdio_uart(${PROJECT_NAME} 0)

target_link_libraries(${PROJECT_NAME} pico_stdlib)

# pico_add_extra_outputs(${PROJECT_NAME})
