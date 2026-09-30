#include <stdio.h>
#include <stdlib.h>
#include <SDL3/SDL.h>

int main(int argc, char *argv[]) {
    printf("开始初始化SDL...\n");
    
    // 初始化SDL所有子系统
    if (SDL_Init(SDL_INIT_EVERYTHING) < 0) {
        fprintf(stderr, "SDL初始化失败: %s\n", SDL_GetError());
        return 1;
    }
    printf("SDL初始化成功\n");
    
    // 创建窗口
    SDL_Window *window = SDL_CreateWindow("Test Window", 640, 480, 0);
    if (!window) {
        fprintf(stderr, "创建窗口失败: %s\n", SDL_GetError());
        SDL_Quit();
        return 1;
    }
    printf("窗口创建成功\n");
    
    // 创建渲染器
    SDL_Renderer *renderer = SDL_CreateRenderer(window, NULL);
    if (!renderer) {
        fprintf(stderr, "创建渲染器失败: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        SDL_Quit();
        return 1;
    }
    printf("渲染器创建成功\n");
    
    // 主循环
    int running = 1;
    int frame_count = 0;
    while (running) {
        frame_count++;
        if (frame_count % 60 == 0) {
            printf("运行中... 帧数: %d\n", frame_count);
        }
        
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_EVENT_QUIT) {
                running = 0;
            }
            if (event.type == SDL_EVENT_KEY_DOWN) {
                if (event.key.key == SDLK_ESCAPE) {
                    running = 0;
                }
            }
        }
        
        // 清屏
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        SDL_RenderClear(renderer);
        SDL_RenderPresent(renderer);
        
        SDL_Delay(16); // 约60 FPS
    }
    
    // 清理
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    printf("程序正常退出\n");
    
    return 0;
}
