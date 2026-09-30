cmake_minimum_required(VERSION 3.15)

project(lvgl_sdl3_demo C)

set(CMAKE_C_STANDARD 99)

set(LVGL_ROOT_DIR /Users/wonderxue/Desktop/SDKs/3rd_party/lvgl/lvgl)


file(GLOB_RECURSE SOURCES ${LVGL_ROOT_DIR}/src/*.c
                          ${LVGL_ROOT_DIR}/src/*.cpp
                          ${LVGL_ROOT_DIR}/src/*.S)

add_executable(lvgl_demo ${SOURCES} main.c lv_demo_stress.c)
add_compile_definitions(SDL_ENABLE_OLD_NAMES)
target_include_directories(lvgl_demo PRIVATE ${CMAKE_CURRENT_LIST_DIR} ${LVGL_ROOT_DIR})

find_library(SDL3 SDL3 REQUIRED)

target_link_libraries(lvgl_demo PRIVATE ${SDL3})
