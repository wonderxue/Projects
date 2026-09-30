/**
 * Pixel Screen Simulator - core implementation
 *
 * SDL3 owns the window/renderer, LVGL v9 provides a display object at
 * the same logical resolution (its flush is acknowledged immediately;
 * demos drive fb directly). Rendering is a scaled block per logical
 * pixel plus a 1px grid overlay on top.
 */

#include "pixel_screen.h"

#include <stdio.h>
#include <stdlib.h>

#include <SDL3/SDL.h>

#include "lvgl.h"

static SDL_Window   *window;
static SDL_Renderer *renderer;
static lv_display_t *lv_disp;
static void         *lv_buf;
static uint64_t      last_tick;

/* ── LVGL flush: nothing to do, fb is driven directly ── */
static void lv_flush_cb(lv_display_t *disp, const lv_area_t *area, uint8_t *px_map)
{
    (void)area;
    (void)px_map;
    lv_display_flush_ready(disp);
}

/* ── Lifecycle ── */
int ps_init(PixelScreen *ps, int px_x, int px_y,
            int pixel_size, int margin, const char *title)
{
    ps->pixel_size = pixel_size;
    ps->px_x       = px_x;
    ps->px_y       = px_y;
    ps->margin     = margin;
    ps->win_w      = pixel_size * px_x + 2 * margin;
    ps->win_h      = pixel_size * px_y + 2 * margin;

    ps->fb = calloc((size_t)px_x * (size_t)px_y, sizeof(uint32_t));
    if (!ps->fb) {
        fprintf(stderr, "ps_init: framebuffer alloc failed\n");
        return 0;
    }

    if (!SDL_Init(SDL_INIT_VIDEO)) {
        fprintf(stderr, "SDL_Init: %s\n", SDL_GetError());
        return 0;
    }

    window = SDL_CreateWindow(title ? title : "Pixel Screen",
                              ps->win_w, ps->win_h, 0);
    if (!window) {
        fprintf(stderr, "SDL_CreateWindow: %s\n", SDL_GetError());
        return 0;
    }

    renderer = SDL_CreateRenderer(window, NULL);
    if (!renderer) {
        fprintf(stderr, "SDL_CreateRenderer: %s\n", SDL_GetError());
        return 0;
    }

    /* LVGL v9 display at the logical resolution */
    lv_init();
    lv_disp = lv_display_create(px_x, px_y);
    lv_display_set_flush_cb(lv_disp, lv_flush_cb);

    uint32_t buf_size = (uint32_t)px_x * 10 * sizeof(lv_color_t);
    lv_buf = malloc(buf_size);
    if (!lv_buf) {
        fprintf(stderr, "ps_init: lvgl buffer alloc failed\n");
        return 0;
    }
    lv_display_set_buffers(lv_disp, lv_buf, NULL, buf_size,
                           LV_DISPLAY_RENDER_MODE_PARTIAL);

    last_tick = SDL_GetTicks();
    return 1;
}

void ps_destroy(PixelScreen *ps)
{
    free(lv_buf);
    lv_buf = NULL;
    free(ps->fb);
    ps->fb = NULL;
    if (renderer) SDL_DestroyRenderer(renderer);
    if (window)   SDL_DestroyWindow(window);
    SDL_Quit();
}

/* ── Per-frame ── */
int ps_poll_quit(void)
{
    SDL_Event e;
    int quit = 0;
    while (SDL_PollEvent(&e)) {
        if (e.type == SDL_EVENT_QUIT) quit = 1;
        else if (e.type == SDL_EVENT_KEY_DOWN &&
                 e.key.key == SDLK_ESCAPE) quit = 1;
    }
    return quit;
}

void ps_tick(void)
{
    uint64_t now = SDL_GetTicks();
    lv_tick_inc((uint32_t)(now - last_tick));
    last_tick = now;
    lv_timer_handler();
}

void ps_delay_ms(uint32_t ms)
{
    SDL_Delay(ms);
}

/* ── Framebuffer ops ── */
void ps_set_pixel(PixelScreen *ps, int x, int y,
                  uint8_t r, uint8_t g, uint8_t b, uint8_t a)
{
    if (x < 0 || x >= ps->px_x || y < 0 || y >= ps->px_y) return;
    uint32_t *dst = &ps->fb[y * ps->px_x + x];
    if (a == 255) {
        *dst = ps_rgb(r, g, b) | 0xFF000000;
    } else if (a > 0) {
        uint32_t bg = *dst;
        uint8_t br, bg8, bb;
        ps_unpack_rgb(bg, &br, &bg8, &bb);
        int inv = 255 - a;
        *dst = ps_rgb((uint8_t)((r * a + br * inv) / 255),
                      (uint8_t)((g * a + bg8 * inv) / 255),
                      (uint8_t)((b * a + bb * inv) / 255)) | 0xFF000000;
    }
}

void ps_clear(PixelScreen *ps, uint8_t r, uint8_t g, uint8_t b)
{
    uint32_t c = ps_rgb(r, g, b) | 0xFF000000;
    int n = ps->px_x * ps->px_y;
    for (int i = 0; i < n; i++) ps->fb[i] = c;
}

void ps_fade(PixelScreen *ps, int num, int denom)
{
    int n = ps->px_x * ps->px_y;
    for (int i = 0; i < n; i++) {
        uint8_t r, g, b;
        ps_unpack_rgb(ps->fb[i], &r, &g, &b);
        ps->fb[i] = ps_rgb((uint8_t)(r * num / denom),
                           (uint8_t)(g * num / denom),
                           (uint8_t)(b * num / denom)) | 0xFF000000;
    }
}

/* ── Render framebuffer to the SDL window ── */
void ps_render(const PixelScreen *ps)
{
    /* Panel background */
    SDL_SetRenderDrawColor(renderer, 5, 5, 15, 255);
    SDL_RenderClear(renderer);

    int ox = ps->margin;
    int oy = ps->margin;
    int psz = ps->pixel_size;

    /* One filled block per logical pixel */
    for (int y = 0; y < ps->px_y; y++) {
        for (int x = 0; x < ps->px_x; x++) {
            uint8_t r, g, b;
            ps_unpack_rgb(ps->fb[y * ps->px_x + x], &r, &g, &b);
            SDL_SetRenderDrawColor(renderer, r, g, b, 255);
            SDL_FRect rect = {
                (float)(ox + x * psz),
                (float)(oy + y * psz),
                (float)psz, (float)psz
            };
            SDL_RenderFillRect(renderer, &rect);
        }
    }

    /* Subtle grid over the pixel seams */
    SDL_SetRenderDrawColor(renderer, 25, 25, 35, 255);
    for (int x = 0; x <= ps->px_x; x++) {
        SDL_RenderLine(renderer,
                       (float)(ox + x * psz), (float)oy,
                       (float)(ox + x * psz), (float)(oy + ps->px_y * psz));
    }
    for (int y = 0; y <= ps->px_y; y++) {
        SDL_RenderLine(renderer,
                       (float)ox, (float)(oy + y * psz),
                       (float)(ox + ps->px_x * psz), (float)(oy + y * psz));
    }

    SDL_RenderPresent(renderer);
}
