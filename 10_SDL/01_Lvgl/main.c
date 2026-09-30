#define SDL_MAIN_HANDLED        /* To fix SDL's "undefined reference to WinMain" issue */
#include "lvgl.h"
#include "lv_demo_stress.h"

#include <SDL3/SDL.h>
SDL_Window *win;
SDL_Renderer *ren;
SDL_Texture *tex;
static uint8_t draw_buf[800 * 1200 * 4]; // 全屏缓冲区


int InitSDL()
{
    SDL_Init(SDL_INIT_VIDEO);
    win = SDL_CreateWindow("Demo",800,1200,SDL_WINDOW_RESIZABLE);
    ren=SDL_CreateRenderer(win,NULL);
    tex = SDL_CreateTexture(ren,SDL_PIXELFORMAT_ARGB8888,SDL_TEXTUREACCESS_STREAMING,800,1200);
    SDL_SetRenderLogicalPresentation(ren, 800, 1200,
                                SDL_LOGICAL_PRESENTATION_INTEGER_SCALE);
    SDL_SetRenderDrawColor(ren,255,255,255,255);
}
void disp_flush(lv_display_t *disp, const lv_area_t *area, uint8_t *px)
{
    SDL_Rect src={
        .x = area->x1,
        .y =area->y1,
        .w = area->x2 - area->x1+1,
        .h = area->y2 - area->y1 +1,
    };
    SDL_UpdateTexture(tex,&src,px,800*4);
    // SDL_RenderTexture(ren,tex,NULL,NULL);
    lv_display_flush_ready(disp);
}
void lv_disp__i()
{
    lv_display_t *disp = lv_display_create(800,1200);
    lv_display_set_buffers(disp, draw_buf, NULL, sizeof(draw_buf), LV_DISPLAY_RENDER_MODE_FULL);
    lv_display_set_flush_cb(disp,disp_flush);
    lv_display_set_color_format(disp,LV_COLOR_FORMAT_ARGB8888);
}
bool is=1;

static lv_obj_t * main_page,*obj;
lv_anim_t a;
static void arc_set_end_angle_anim(void * obj, int32_t v)
{
    lv_arc_set_end_angle(obj, v);
}
void show()
{
    main_page = lv_obj_create(lv_screen_active());
            lv_obj_set_size(main_page, LV_HOR_RES / 2, LV_VER_RES/2);
            lv_obj_set_flex_flow(main_page, LV_FLEX_FLOW_COLUMN_WRAP);

            obj = lv_arc_create(main_page);
            lv_obj_set_size(obj, 200, 200);  // 或者任意合适的尺寸
            lv_obj_center(main_page);
            lv_anim_init(&a);
            lv_anim_set_var(&a, obj);
            lv_anim_set_values(&a, 180, 400);
            lv_anim_set_duration(&a, LV_DEMO_STRESS_TIME_STEP * 2);
            lv_anim_set_delay(&a, LV_DEMO_STRESS_TIME_STEP + 25);
            lv_anim_set_reverse_duration(&a, LV_DEMO_STRESS_TIME_STEP * 5);
            lv_anim_set_repeat_count(&a, 100);
            lv_anim_set_exec_cb(&a, arc_set_end_angle_anim);
            lv_anim_start(&a);
}
int main()
{
    InitSDL();
    /* Initialize LVGL */
    lv_init();
    lv_disp__i();
    show();
    /* Create widgets on the screen */
    // lv_demo_stress();
    uint32_t i=SDL_GetTicks();
    while (is) {
        
        SDL_Event evn;
        while (SDL_PollEvent(&evn))
        {
            /* code */
            if(evn.type == SDL_EVENT_QUIT)
            {
                is = false;
            }
        }
        SDL_RenderClear(ren);
        SDL_RenderTexture(ren,tex,NULL,NULL);
        SDL_RenderPresent(ren);
        

        uint32_t j=SDL_GetTicks();
        lv_tick_inc(j-i);
        i=j;
        lv_timer_handler();
        SDL_Delay(1);

    }
    SDL_DestroyTexture(tex);
    SDL_DestroyRenderer(ren);
    SDL_DestroyWindow(win);
    SDL_Quit();
    return 0;
}