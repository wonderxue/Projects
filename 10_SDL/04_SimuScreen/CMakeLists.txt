cmake_minimum_required(VERSION 3.12)
project(SimuScreen LANGUAGES C)

set(CMAKE_C_STANDARD 11)

# ── SDL3 ──
find_library(SDL3 SDL3 REQUIRED)
find_path(SDL3_INCLUDE_DIR
    NAMES SDL3/SDL.h
    PATHS /opt/homebrew/include /usr/local/include /usr/include
)

# ── LVGL ──
set(LVGL_DIR "/Users/wonderxue/Desktop/SDKs/3rd_party/lvgl/lvgl")

file(GLOB_RECURSE LVGL_SOURCES "${LVGL_DIR}/src/*.c")

add_executable(amoled_demo
    demos/amoled_demo.c
    src/screen_simulator.c
    ${LVGL_SOURCES}
)

target_include_directories(amoled_demo PRIVATE
    ${SDL3_INCLUDE_DIR}
    ${LVGL_DIR}                         # for #include "lvgl.h"
    ${LVGL_DIR}/src                     # for internal LVGL includes
    ${CMAKE_CURRENT_SOURCE_DIR}         # for lv_conf.h
)

target_link_libraries(amoled_demo
    ${SDL3}
    m
    pthread
)
target_compile_options(amoled_demo PRIVATE -Wall -Wextra -O2)


add_executable(pixel_demo
    demos/pixel_demo.c
    src/screen_simulator.c
    ${LVGL_SOURCES}
)

target_include_directories(pixel_demo PRIVATE
    ${SDL3_INCLUDE_DIR}
    ${LVGL_DIR}                         # for #include "lvgl.h"
    ${LVGL_DIR}/src                     # for internal LVGL includes
    ${CMAKE_CURRENT_SOURCE_DIR}         # for lv_conf.h
)

target_link_libraries(pixel_demo
    ${SDL3}
    m
    pthread
)
target_compile_options(pixel_demo PRIVATE -Wall -Wextra -O2)

add_executable(glow_demo
    demos/glow_demo.c
    src/screen_simulator.c
    ${LVGL_SOURCES}
)

target_include_directories(glow_demo PRIVATE
    ${SDL3_INCLUDE_DIR}
    ${LVGL_DIR}                         # for #include "lvgl.h"
    ${LVGL_DIR}/src                     # for internal LVGL includes
    ${CMAKE_CURRENT_SOURCE_DIR}         # for lv_conf.h
)

target_link_libraries(glow_demo
    ${SDL3}
    m
    pthread
)
target_compile_options(glow_demo PRIVATE -Wall -Wextra -O2)

# ── USB Screen Simulator (上位机) ──
add_executable(usb_screen_simulator
    app/main.c
    src/screen_simulator.c
    ${LVGL_SOURCES}
)

target_include_directories(usb_screen_simulator PRIVATE
    src
    ${LVGL_DIR}                         # for #include "lvgl.h"
    ${LVGL_DIR}/src                     # for internal LVGL includes
    ${CMAKE_CURRENT_SOURCE_DIR}         # for lv_conf.h
)

target_link_libraries(usb_screen_simulator
    ${SDL3}
    m
    pthread
)

# # ── Pico2040 USB Data Sender ──
# # 注意: 需要Pico SDK支持
# add_executable(pico_usb_sender
#     pico/main.c
# )

# # 添加Pico SDK支持
# set(PICO_SDK_PATH "/Users/wonderxue/Desktop/SDKs/PICO/pico-sdk")
# set(PICO_TOOLCHAIN_PATH "/Users/wonderxue/Desktop/ToolChains/ARM/arm-gnu-toolchain-14.2.rel1-darwin-arm64-arm-none-eabi/bin")
# set(PICO_PLATFORM "rp2040")

# # 正确导入Pico SDK
# include(${PICO_SDK_PATH}/external/pico_sdk_import.cmake)

# target_compile_options(pico_usb_sender PRIVATE
#     -Wall -Wextra -O2
# )

# target_link_libraries(pico_usb_sender
#     pico_stdlib
#     hardware_usb
#     hardware_usb_cdc
# )

# # 添加Pico SDK和LVGL支持
# target_include_directories(pico_usb_sender PRIVATE
#     ${PICO_SDK_PATH}/src/common/pico_base_headers/include
#     ${PICO_SDK_PATH}/src/common/pico_stdlib_headers/include
#     ${PICO_SDK_PATH}/src/rp2_common
#     ${LVGL_DIR}/src
# )

# target_link_libraries(pico_usb_sender
#     m
# )
