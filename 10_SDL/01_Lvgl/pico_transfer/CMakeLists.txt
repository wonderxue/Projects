cmake_minimum_required(VERSION 3.12)
project(PicoLvglReceiver LANGUAGES C)

set(CMAKE_C_STANDARD 11)

# ── 查找SDL3库 ──
find_library(SDL3_LIBRARIES SDL3 REQUIRED)
find_path(SDL3_INCLUDE_DIRS SDL3/SDL.h REQUIRED)
message(STATUS "Found SDL3: ${SDL3_LIBRARIES}")
message(STATUS "SDL3 include: ${SDL3_INCLUDE_DIRS}")

# ── 屏幕模拟器源文件 ──
set(SCREEN_SIMULATOR_SOURCES
    ../../03_SimuScreen/src/screen_simulator.c
)

# ── 主应用程序 ──
add_executable(lvgl_receiver
    simple_receiver.c
    pico_lvgl_protocol.c
    ${SCREEN_SIMULATOR_SOURCES}
)

target_include_directories(lvgl_receiver PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/../../03_SimuScreen/src
    ${SDL3_INCLUDE_DIRS}
)

target_link_libraries(lvgl_receiver
    ${SDL3_LIBRARIES}
    m
    pthread
)

target_compile_options(lvgl_receiver PRIVATE -Wall -Wextra -O2)

# ── 自定义目标 ──
add_custom_target(run_receiver
    COMMAND lvgl_receiver
    DEPENDS lvgl_receiver
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Running LVGL Data Receiver")

add_custom_target(test_receiver
    COMMAND lvgl_receiver --help
    DEPENDS lvgl_receiver
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Testing receiver setup")

# ── 复制配置文件 ──
configure_file(config.example config.txt COPYONLY)
