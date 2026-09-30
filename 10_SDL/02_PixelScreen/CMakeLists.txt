cmake_minimum_required(VERSION 3.12)
project(PixelScreen LANGUAGES C)

set(CMAKE_C_STANDARD 11)

# ── Configurable pixel screen parameters ──
# set(PIXEL_SIZE       8  CACHE STRING "Size of each logical pixel in screen pixels")
# set(SCREEN_PIXELS_X  64 CACHE STRING "Number of logical pixels horizontally")
# set(SCREEN_PIXELS_Y  32 CACHE STRING "Number of logical pixels vertically")
# set(MARGIN           10 CACHE STRING "Margin around the pixel grid")

# add_compile_definitions(
#     PIXEL_SIZE=${PIXEL_SIZE}
#     SCREEN_PIXELS_X=${SCREEN_PIXELS_X}
#     SCREEN_PIXELS_Y=${SCREEN_PIXELS_Y}
#     MARGIN=${MARGIN}
# )

# ── SDL3 ──
find_library(SDL3 SDL3 REQUIRED)
find_path(SDL3_INCLUDE_DIR
    NAMES SDL3/SDL.h
    PATHS /opt/homebrew/include /usr/local/include /usr/include
)

# ── LVGL ──
set(LVGL_DIR "/Users/wonderxue/Desktop/SDKs/3rd_party/lvgl/lvgl")

file(GLOB_RECURSE LVGL_SOURCES "${LVGL_DIR}/src/*.c")

add_executable(pixelscreen
    demo_fireworks.c
    src/pixel_screen.c
    ${LVGL_SOURCES}
)

target_include_directories(pixelscreen PRIVATE
    ${SDL3_INCLUDE_DIR}
    ${LVGL_DIR}                         # for #include "lvgl.h"
    ${LVGL_DIR}/src                     # for internal LVGL includes
    ${CMAKE_CURRENT_SOURCE_DIR}         # for lv_conf.h
)

target_link_libraries(pixelscreen
    ${SDL3}
    m
    pthread
)

target_compile_options(pixelscreen PRIVATE -Wall -Wextra -O2)
