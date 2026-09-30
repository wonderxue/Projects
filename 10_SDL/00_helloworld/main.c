#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <SDL3/SDL.h>
#include <SDL3/SDL_main.h>

// 屏幕尺寸
#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600
#define BUFFER_WIDTH 400
#define BUFFER_HEIGHT 300
#define BYTES_PER_PIXEL 4  // RGBA

// 颜色定义（ARGB格式）
#define COLOR_RED    0xFFFF0000
#define COLOR_GREEN  0xFF00FF00
#define COLOR_BLUE   0xFF0000FF
#define COLOR_WHITE  0xFFFFFFFF
#define COLOR_BLACK  0xFF000000
#define COLOR_YELLOW 0xFFFFFF00
#define COLOR_CYAN   0xFF00FFFF
#define COLOR_MAGENTA 0xFFFF00FF
#define COLOR_GRAY   0xFF888888

// 全局变量
SDL_Window* window = NULL;
SDL_Renderer* renderer = NULL;
SDL_Texture* texture = NULL;
uint32_t* buffer = NULL;
bool running = true;
float animation_time = 0.0f;

// 初始化SDL3
bool init_sdl() {
    SDL_Init(SDL_INIT_VIDEO);
    
    // 创建窗口（SDL3 API有变化）
    window = SDL_CreateWindow(
        "SDL3 Buffer Demo",
        SCREEN_WIDTH,
        SCREEN_HEIGHT,
        SDL_WINDOW_HIGH_PIXEL_DENSITY
    );
    
    if (!window) {
        printf("窗口创建失败: %s\n", SDL_GetError());
        return false;
    }
    
    // 创建渲染器
    renderer = SDL_CreateRenderer(window, NULL);
    if (!renderer) {
        printf("渲染器创建失败: %s\n", SDL_GetError());
        return false;
    }
    
    // 设置渲染器属性
    SDL_SetRenderVSync(renderer, 1);
    
    // 创建纹理（SDL3中可能需要指定像素格式）
    texture = SDL_CreateTexture(
        renderer,
        SDL_PIXELFORMAT_ARGB8888,
        SDL_TEXTUREACCESS_STREAMING,
        BUFFER_WIDTH,
        BUFFER_HEIGHT
    );
    
    if (!texture) {
        printf("纹理创建失败: %s\n", SDL_GetError());
        return false;
    }
    
    // 分配buffer内存
    buffer = (uint32_t*)malloc(BUFFER_WIDTH * BUFFER_HEIGHT * sizeof(uint32_t));
    if (!buffer) {
        printf("Buffer分配失败\n");
        return false;
    }
    
    return true;
}

// 清理资源
void cleanup() {
    if (texture) SDL_DestroyTexture(texture);
    if (renderer) SDL_DestroyRenderer(renderer);
    if (window) SDL_DestroyWindow(window);
    if (buffer) free(buffer);
    SDL_Quit();
}

// 绘制单个像素到buffer
void draw_pixel(int x, int y, uint32_t color) {
    if (x >= 0 && x < BUFFER_WIDTH && y >= 0 && y < BUFFER_HEIGHT) {
        buffer[y * BUFFER_WIDTH + x] = color;
    }
}

// 绘制矩形到buffer
void draw_rect(int x, int y, int w, int h, uint32_t color) {
    int end_x = x + w;
    int end_y = y + h;
    
    // 裁剪到buffer范围
    if (x < 0) x = 0;
    if (y < 0) y = 0;
    if (end_x > BUFFER_WIDTH) end_x = BUFFER_WIDTH;
    if (end_y > BUFFER_HEIGHT) end_y = BUFFER_HEIGHT;
    
    for (int i = y; i < end_y; i++) {
        for (int j = x; j < end_x; j++) {
            buffer[i * BUFFER_WIDTH + j] = color;
        }
    }
}

// 绘制带边框的矩形
void draw_rect_outline(int x, int y, int w, int h, uint32_t color, int border_width) {
    // 填充内部
    draw_rect(x + border_width, y + border_width, 
              w - 2*border_width, h - 2*border_width, color);
    
    // 绘制边框
    uint32_t border_color = 0xFF000000; // 黑色边框
    draw_rect(x, y, w, border_width, border_color); // 上边框
    draw_rect(x, y + h - border_width, w, border_width, border_color); // 下边框
    draw_rect(x, y, border_width, h, border_color); // 左边框
    draw_rect(x + w - border_width, y, border_width, h, border_color); // 右边框
}

// 绘制圆形到buffer
void draw_circle(int center_x, int center_y, int radius, uint32_t color) {
    int radius_sq = radius * radius;
    int start_x = center_x - radius;
    int start_y = center_y - radius;
    int end_x = center_x + radius;
    int end_y = center_y + radius;
    
    // 裁剪到buffer范围
    if (start_x < 0) start_x = 0;
    if (start_y < 0) start_y = 0;
    if (end_x > BUFFER_WIDTH) end_x = BUFFER_WIDTH;
    if (end_y > BUFFER_HEIGHT) end_y = BUFFER_HEIGHT;
    
    for (int y = start_y; y < end_y; y++) {
        int dy = y - center_y;
        int dy_sq = dy * dy;
        
        for (int x = start_x; x < end_x; x++) {
            int dx = x - center_x;
            if (dx*dx + dy_sq <= radius_sq) {
                buffer[y * BUFFER_WIDTH + x] = color;
            }
        }
    }
}

// 绘制线条到buffer（Bresenham算法）
void draw_line(int x0, int y0, int x1, int y1, uint32_t color) {
    int dx = abs(x1 - x0);
    int dy = abs(y1 - y0);
    int sx = (x0 < x1) ? 1 : -1;
    int sy = (y0 < y1) ? 1 : -1;
    int err = dx - dy;
    
    while (true) {
        draw_pixel(x0, y0, color);
        
        if (x0 == x1 && y0 == y1) break;
        
        int e2 = 2 * err;
        if (e2 > -dy) {
            err -= dy;
            x0 += sx;
        }
        if (e2 < dx) {
            err += dx;
            y0 += sy;
        }
    }
}

// 绘制三角形
void draw_triangle(int x1, int y1, int x2, int y2, int x3, int y3, uint32_t color) {
    draw_line(x1, y1, x2, y2, color);
    draw_line(x2, y2, x3, y3, color);
    draw_line(x3, y3, x1, y1, color);
}

// 清除buffer（填充为黑色）
void clear_buffer() {
    for (int i = 0; i < BUFFER_WIDTH * BUFFER_HEIGHT; i++) {
        buffer[i] = COLOR_BLACK;
    }
}

// 生成彩虹渐变背景
void draw_rainbow_background(float time) {
    for (int y = 0; y < BUFFER_HEIGHT; y++) {
        float hue = (y + time * 20) / BUFFER_HEIGHT;
        
        // HSV 转 RGB
        float h = hue * 6.0f;
        int i = (int)h;
        float f = h - i;
        float p = 0.0f;
        float q = 1.0f - f;
        float t = f;
        
        float r, g, b;
        switch (i % 6) {
            case 0: r = 1.0f; g = t; b = p; break;
            case 1: r = q; g = 1.0f; b = p; break;
            case 2: r = p; g = 1.0f; b = t; break;
            case 3: r = p; g = q; b = 1.0f; break;
            case 4: r = t; g = p; b = 1.0f; break;
            case 5: r = 1.0f; g = p; b = q; break;
        }
        
        uint32_t color = 0xFF000000 | 
                        ((uint32_t)(r * 255) << 16) |
                        ((uint32_t)(g * 255) << 8) |
                        (uint32_t)(b * 255);
        
        for (int x = 0; x < BUFFER_WIDTH; x++) {
            // 添加一些水平变化
            float wave = sin(x * 0.05f + time * 2.0f) * 0.1f + 0.9f;
            uint8_t r_final = (uint8_t)(((color >> 16) & 0xFF) * wave);
            uint8_t g_final = (uint8_t)(((color >> 8) & 0xFF) * wave);
            uint8_t b_final = (uint8_t)((color & 0xFF) * wave);
            
            buffer[y * BUFFER_WIDTH + x] = 0xFF000000 | 
                                          (r_final << 16) |
                                          (g_final << 8) |
                                          b_final;
        }
    }
}

// 更新buffer内容（示例绘图）
void update_buffer(float delta_time) {
    animation_time += delta_time;
    
    // 方法1：彩虹渐变背景
    draw_rainbow_background(animation_time);
    
    // 方法2：纯色背景（注释掉上一行，取消注释下一行）
    // clear_buffer();
    
    // 绘制旋转的矩形
    float angle = animation_time * 2.0f;
    int rect_size = 80;
    int center_x = BUFFER_WIDTH / 2;
    int center_y = BUFFER_HEIGHT / 2;
    
    // 计算旋转后的矩形顶点
    float cos_a = cos(angle);
    float sin_a = sin(angle);
    int half_size = rect_size / 2;
    
    int x1 = center_x + (int)(-half_size * cos_a + -half_size * sin_a);
    int y1 = center_y + (int)(-half_size * sin_a - -half_size * cos_a);
    int x2 = center_x + (int)( half_size * cos_a + -half_size * sin_a);
    int y2 = center_y + (int)( half_size * sin_a - -half_size * cos_a);
    int x3 = center_x + (int)( half_size * cos_a +  half_size * sin_a);
    int y3 = center_y + (int)( half_size * sin_a -  half_size * cos_a);
    int x4 = center_x + (int)(-half_size * cos_a +  half_size * sin_a);
    int y4 = center_y + (int)(-half_size * sin_a -  half_size * cos_a);
    
    // 绘制旋转的矩形
    draw_line(x1, y1, x2, y2, COLOR_WHITE);
    draw_line(x2, y2, x3, y3, COLOR_WHITE);
    draw_line(x3, y3, x4, y4, COLOR_WHITE);
    draw_line(x4, y4, x1, y1, COLOR_WHITE);
    
    // 绘制脉动的圆形
    int pulse_radius = 30 + (int)(sin(animation_time * 3.0f) * 15);
    draw_circle(BUFFER_WIDTH / 4, BUFFER_HEIGHT / 4, pulse_radius, COLOR_CYAN);
    
    // 绘制移动的矩形
    int moving_x = (int)(sin(animation_time) * (BUFFER_WIDTH - 120) / 2 + BUFFER_WIDTH / 2);
    int moving_y = (int)(cos(animation_time * 1.5f) * (BUFFER_HEIGHT - 80) / 2 + BUFFER_HEIGHT / 2);
    draw_rect_outline(moving_x - 40, moving_y - 30, 80, 60, COLOR_MAGENTA, 2);
    
    // 绘制动态线条网格
    for (int i = 0; i <= 10; i++) {
        int x = i * BUFFER_WIDTH / 10;
        int y = i * BUFFER_HEIGHT / 10;
        int offset = (int)(sin(animation_time + i * 0.5f) * 20);
        
        // 垂直线
        draw_line(x + offset, 0, x + offset, BUFFER_HEIGHT, COLOR_YELLOW);
        // 水平线
        draw_line(0, y + offset, BUFFER_WIDTH, y + offset, COLOR_YELLOW);
    }
    
    // 绘制中心点
    draw_circle(center_x, center_y, 8, COLOR_RED);
    
    // 添加一些随机星星
    static int star_positions[100][2];
    static bool initialized = false;
    
    if (!initialized) {
        for (int i = 0; i < 100; i++) {
            star_positions[i][0] = rand() % BUFFER_WIDTH;
            star_positions[i][1] = rand() % BUFFER_HEIGHT;
        }
        initialized = true;
    }
    
    for (int i = 0; i < 100; i++) {
        // 星星闪烁效果
        float brightness = 0.5f + 0.5f * sin(animation_time * 5.0f + i * 0.1f);
        uint8_t star_brightness = (uint8_t)(brightness * 255);
        uint32_t star_color = 0xFF000000 | 
                             (star_brightness << 16) |
                             (star_brightness << 8) |
                             star_brightness;
        
        draw_pixel(star_positions[i][0], star_positions[i][1], star_color);
        // 绘制小十字作为星星
        draw_pixel(star_positions[i][0] + 1, star_positions[i][1], star_color);
        draw_pixel(star_positions[i][0] - 1, star_positions[i][1], star_color);
        draw_pixel(star_positions[i][0], star_positions[i][1] + 1, star_color);
        draw_pixel(star_positions[i][0], star_positions[i][1] - 1, star_color);
    }
}

// 将buffer绘制到屏幕
void render_buffer() {
    // 更新纹理数据
    SDL_UpdateTexture(texture, NULL, buffer, BUFFER_WIDTH * sizeof(uint32_t));
    
    // 清除渲染器
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_RenderClear(renderer);
    
    // 复制纹理到渲染器（可缩放）
    SDL_FRect dest_rect = {
        (SCREEN_WIDTH - BUFFER_WIDTH * 2) / 2.0f,  // 居中并放大2倍
        (SCREEN_HEIGHT - BUFFER_HEIGHT * 2) / 2.0f,
        BUFFER_WIDTH * 2.0f,
        BUFFER_HEIGHT * 2.0f
    };
    
    SDL_RenderTexture(renderer, texture, NULL, &dest_rect);
    
    // 显示渲染结果
    SDL_RenderPresent(renderer);
}

// 处理输入事件
void handle_events() {
    SDL_Event event;
    while (SDL_PollEvent(&event)) {
        switch (event.type) {
            case SDL_EVENT_QUIT:
                running = false;
                break;
                
            case SDL_EVENT_KEY_DOWN:
                switch (event.key.key) {
                    case SDLK_ESCAPE:
                        running = false;
                        break;
                    case SDLK_SPACE:
                        printf("空格键按下 - 重新生成随机图案\n");
                        break;
                    case SDLK_F:
                        printf("F键按下 - 切换填充模式\n");
                        break;
                }
                break;
                
            case SDL_EVENT_MOUSE_BUTTON_DOWN:
                printf("鼠标点击: (%f, %f)\n", 
                       event.button.x, event.button.y);
                break;
        }
    }
}

int main(int argc, char* argv[]) {
    if (!init_sdl()) {
        return 1;
    }
    
    printf("SDL3 Buffer Demo 运行中...\n");
    printf("控制说明:\n");
    printf("  ESC - 退出程序\n");
    printf("  空格 - 重新生成随机图案\n");
    printf("  F   - 切换填充模式\n");
    printf("  鼠标点击 - 显示坐标\n");
    
    Uint64 last_time = SDL_GetTicks();
    Uint32 frame_count = 0;
    Uint32 last_fps_time = last_time;
    float delta_time = 0.0f;
    
    // 主循环
    while (running) {
        Uint64 current_time = SDL_GetTicks();
        delta_time = (current_time - last_time) / 1000.0f;
        last_time = current_time;
        
        handle_events();
        
        // 更新buffer内容
        update_buffer(delta_time);
        
        // 渲染buffer到屏幕
        render_buffer();
        
        frame_count++;
        
        // 计算并显示FPS
        if (current_time - last_fps_time >= 1000) {
            float fps = frame_count * 1000.0f / (current_time - last_fps_time);
            char title[256];
            snprintf(title, sizeof(title), 
                    "SDL3 Buffer Demo - FPS: %.1f | Delta Time: %.3fms", 
                    fps, delta_time * 1000);
            SDL_SetWindowTitle(window, title);
            last_fps_time = current_time;
            frame_count = 0;
        }
        
        // 使用SDL_Delay控制最小帧时间
        SDL_Delay(1);
    }
    
    cleanup();
    return 0;
}