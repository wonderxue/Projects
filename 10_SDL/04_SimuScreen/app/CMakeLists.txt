add_executable(usb_screen_simulator
    main.c
)

target_include_directories(usb_screen_simulator PRIVATE
    ../src
)

target_link_libraries(usb_screen_simulator
    ../amoled_demo
)
