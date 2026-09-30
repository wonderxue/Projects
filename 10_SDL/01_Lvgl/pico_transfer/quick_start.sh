#!/bin/bash

# Pico LVGL Data Transfer - 快速启动脚本
# 用于快速编译和运行LVGL数据传输系统

echo "=========================================="
echo "Pico LVGL Data Transfer System"
echo "=========================================="
echo ""

# 检查依赖
check_dependencies() {
    echo "检查依赖..."
    
    # 检查SDL3
    if ! pkg-config --exists sdl3; then
        echo "❌ SDL3未安装"
        echo "请安装SDL3: brew install sdl3"
        exit 1
    fi
    
    # 检查CMake
    if ! command -v cmake &> /dev/null; then
        echo "❌ CMake未安装"
        echo "请安装CMake: brew install cmake"
        exit 1
    fi
    
    # 检查LVGL
    if [ ! -d "/Users/wonderxue/Desktop/SDKs/3rd_party/lvgl/lvgl" ]; then
        echo "❌ LVGL未找到"
        echo "请确保LVGL路径正确: /Users/wonderxue/Desktop/SDKs/3rd_party/lvgl/lvgl"
        exit 1
    fi
    
    echo "✅ 所有依赖已安装"
}

# 构建接收器
build_receiver() {
    echo "构建LVGL数据接收器..."
    
    mkdir -p build
    cd build
    
    if ! cmake ..; then
        echo "❌ CMake配置失败"
        exit 1
    fi
    
    if ! make -j$(nproc); then
        echo "❌ 编译失败"
        exit 1
    fi
    
    cd ..
    echo "✅ 构建完成"
}

# 运行接收器
run_receiver() {
    echo "启动LVGL数据接收器..."
    
    if [ -f "build/lvgl_receiver" ]; then
        echo "运行默认配置..."
        ./build/lvgl_receiver
    else
        echo "❌ 可执行文件不存在"
        exit 1
    fi
}

# 测试模式
test_mode() {
    echo "测试模式..."
    
    # 测试通信
    echo "测试接收器配置..."
    ./build/lvgl_receiver --help
    
    # 测试不同风格
    echo "测试像素风格..."
    timeout 3s ./build/lvgl_receiver --style pixel &
    
    echo "测试辉光管风格..."
    timeout 3s ./build/lvgl_receiver --style glow &
    
    echo "测试AMOLED风格..."
    timeout 3s ./build/lvgl_receiver --style amoled &
    
    echo "✅ 测试完成"
}

# 编译Pico固件
build_pico_firmware() {
    echo "编译Pico固件..."
    
    echo "注意: Pico固件编译需要单独的环境"
    echo "请使用以下步骤:"
    echo "1. 将 pico_sender.c 复制到Pico开发环境"
    echo "2. 使用CMake或Makefile编译"
    echo "3. 生成UF2文件并刷写到Pico"
    
    # 创建Pico编译脚本模板
    cat > build_pico.sh << 'PIEOF'
#!/bin/bash
# Pico固件编译脚本

echo "编译Pico固件..."

# 创建CMakeLists.txt
cat > CMakeLists.txt << 'EOF'
cmake_minimum_required(VERSION 3.15)

project(pico_lvgl_sender C)

# Pico SDK设置
include(pico_sdk_import.cmake)

pico_sdk_init()

# 添加LVGL
find_path(LVGL_INCLUDE_DIR lvgl.h
    PATHS /Users/wonderxue/Desktop/SDKs/3rd_party/lvgl/lvgl
    NO_DEFAULT_PATH)

# 可执行文件
add_executable(pico_sender
    pico_sender.c
)

# 链接库
target_link_libraries(pico_sender
    pico_stdlib
    pico_usb
    pico_cyw43_arch
    hardware_uart
    hardware_dma
)

# 包含目录
target_include_directories(pico_sender PRIVATE
    ${LVGL_INCLUDE_DIR}
    ${LVGL_INCLUDE_DIR}/src
)

# Pico特定配置
pico_add_extra_outputs(pico_sender)

# 复制协议文件
target_copy_files(pico_sender FILES pico_lvgl_protocol.h pico_lvgl_protocol.c)
PIEOF

    echo "Pico编译脚本已创建: build_pico.sh"
    echo "使用方法: ./build_pico.sh"
}

# 显示帮助
show_help() {
    echo "使用方法:"
    echo "  $0 [选项]"
    echo ""
    echo "选项:"
    echo "  build     构建接收器"
    echo "  run       运行接收器"
    echo "  test      测试模式"
    echo "  pico      编译Pico固件"
    echo "  clean     清理构建"
    echo "  help      显示帮助"
    echo ""
    echo "示例:"
    echo "  $0 build && $0 run"
    echo "  $0 test"
    echo "  $0 pico"
}

# 清理构建
clean_build() {
    echo "清理构建..."
    rm -rf build/*
    echo "✅ 清理完成"
}

# 主程序
main() {
    case "${1:-build}" in
        "build")
            check_dependencies
            build_receiver
            ;;
        "run")
            check_dependencies
            if [ ! -f "build/lvgl_receiver" ]; then
                build_receiver
            fi
            run_receiver
            ;;
        "test")
            check_dependencies
            if [ ! -f "build/lvgl_receiver" ]; then
                build_receiver
            fi
            test_mode
            ;;
        "pico")
            build_pico_firmware
            ;;
        "clean")
            clean_build
            ;;
        "help")
            show_help
            ;;
        *)
            echo "未知选项: $1"
            show_help
            exit 1
            ;;
    esac
}

# 执行主程序
main "$@"
