cmake_minimum_required(VERSION 3.18)

# Pull in SDK (must be before project)

set(PICOTOOL_FETCH_FROM_GIT_PATH "/Users/wonderxue/Desktop/ToolChains/PICO/picotool")
set(PICO_SDK_PATH "~/Desktop/SDKs/PICO/pico-sdk")
set(PICO_TOOLCHAIN_PATH "~/Desktop/ToolChains/ARM/arm-gnu-toolchain-14.2.rel1-darwin-arm64-arm-none-eabi/bin")
include(pico_sdk_import.cmake)
project(pico-nrf24 C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(RADIOLIB_PATH "/Users/wonderxue/Desktop/SDKs/3rd_party/RadioLib")
# Initialize the SDK
pico_sdk_init()

add_compile_options(
    -Wall
    -Wno-format          
    -Wno-unused-function
)

add_subdirectory("${RADIOLIB_PATH}" "${CMAKE_CURRENT_BINARY_DIR}/RadioLib")

# Default transmitter build
add_executable(${PROJECT_NAME}
    main.cpp
    "${RADIOLIB_PATH}/src/hal/RPiPico/PicoHal.cpp"
)
target_compile_definitions(${PROJECT_NAME} PUBLIC RADIOLIB_BUILD_RPI_PICO)

# Enable USB CDC (serial) output for printf
pico_enable_stdio_usb(${PROJECT_NAME} 1)
pico_enable_stdio_uart(${PROJECT_NAME} 0)

# Pull in common dependencies
target_link_libraries(${PROJECT_NAME} pico_stdlib hardware_spi hardware_gpio hardware_timer pico_multicore hardware_pwm RadioLib)

# Create map/bin/hex file etc.
pico_add_extra_outputs(${PROJECT_NAME})

# Add additional targets for different modes
add_executable(${PROJECT_NAME}_transmit
    main_transmit.cpp
    "${RADIOLIB_PATH}/src/hal/RPiPico/PicoHal.cpp"
)
target_compile_definitions(${PROJECT_NAME}_transmit PUBLIC RADIOLIB_BUILD_RPI_PICO)
target_link_libraries(${PROJECT_NAME}_transmit pico_stdlib hardware_spi hardware_gpio hardware_timer pico_multicore hardware_pwm RadioLib)
pico_enable_stdio_usb(${PROJECT_NAME}_transmit 1)
pico_enable_stdio_uart(${PROJECT_NAME}_transmit 0)
pico_add_extra_outputs(${PROJECT_NAME}_transmit)

add_executable(${PROJECT_NAME}_receive
    main_receive.cpp
    "${RADIOLIB_PATH}/src/hal/RPiPico/PicoHal.cpp"
)
target_compile_definitions(${PROJECT_NAME}_receive PUBLIC RADIOLIB_BUILD_RPI_PICO)
target_link_libraries(${PROJECT_NAME}_receive pico_stdlib hardware_spi hardware_gpio hardware_timer pico_multicore hardware_pwm RadioLib)
pico_enable_stdio_usb(${PROJECT_NAME}_receive 1)
pico_enable_stdio_uart(${PROJECT_NAME}_receive 0)
pico_add_extra_outputs(${PROJECT_NAME}_receive)
