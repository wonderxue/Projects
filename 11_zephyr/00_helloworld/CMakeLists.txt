cmake_minimum_required(VERSION 3.20.0)

set(BOARD sf32lb52_devkit_lcd)
find_package(Zephyr)
project(helloworld)
target_sources(app PRIVATE src/main.c)