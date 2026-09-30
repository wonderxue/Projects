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