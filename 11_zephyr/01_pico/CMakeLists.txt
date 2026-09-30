cmake_minimum_required(VERSION 3.20.0)

set(BOARD rpi_pico2/rp2350a/m33)
find_package(Zephyr)
project(helloworld)
zephyr_compile_options(-w)  # -w 表示禁止所有警告
target_sources(app PRIVATE src/main.c)