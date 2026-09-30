/**
 * Screen Simulator - Abstract Interface
 * 
 * Abstract interface for different screen simulation styles.
 * Provides unified API for upper layer applications.
 */

#ifndef SCREEN_SIMULATOR_H
#define SCREEN_SIMULATOR_H

#include <stdint.h>
#include <stdbool.h>

// Screen simulator configuration
typedef struct {
    int width;          /* logical width in pixels */
    int height;         /* logical height in pixels */
    int pixel_size;     /* physical size per logical pixel */
    int margin;         /* margin around the screen */
    const char *title;  /* window title */
    const char *style;  /* style name: "pixel", "glow", "amoled" */
} ScreenConfig;

// Screen simulator handle
typedef struct ScreenSimulator ScreenSimulator;

// Function pointer types for style-specific operations
typedef void (*RenderFunc)(ScreenSimulator *sim);
typedef void (*ClearFunc)(ScreenSimulator *sim, uint8_t r, uint8_t g, uint8_t b);
typedef void (*SetPixelFunc)(ScreenSimulator *sim, int x, int y, uint8_t r, uint8_t g, uint8_t b, uint8_t a);
typedef void (*FadeFunc)(ScreenSimulator *sim, int num, int denom);

// Screen simulator interface
struct ScreenSimulator {
    ScreenConfig config;
    uint32_t *framebuffer;     /* logical framebuffer */
    RenderFunc render;         /* style-specific render function */
    ClearFunc clear;           /* style-specific clear function */
    SetPixelFunc set_pixel;     /* style-specific set pixel function */
    FadeFunc fade;             /* style-specific fade function */
    void *style_data;          /* style-specific private data */
    
    /* SDL and LVGL handles */
    void *sdl_window;
    void *sdl_renderer;
    void *lv_display;
    void *lv_buffer;
    
    uint64_t last_tick;
    bool running;
};

// ── Lifecycle ──
ScreenSimulator* ss_create(const ScreenConfig *config);
void ss_destroy(ScreenSimulator *sim);

// ── Main loop ──
bool ss_poll_quit(ScreenSimulator *sim);
void ss_tick(ScreenSimulator *sim);
void ss_render(ScreenSimulator *sim);
void ss_delay_ms(ScreenSimulator *sim, uint32_t ms);

// ── Framebuffer operations ──
void ss_set_pixel(ScreenSimulator *sim, int x, int y, uint8_t r, uint8_t g, uint8_t b, uint8_t a);
void ss_clear(ScreenSimulator *sim, uint8_t r, uint8_t g, uint8_t b);
void ss_fade(ScreenSimulator *sim, int num, int denom);

// ── Style registration ──
void ss_register_pixel_style(ScreenSimulator *sim);
void ss_register_glow_style(ScreenSimulator *sim);
void ss_register_amoled_style(ScreenSimulator *sim);

// ── Color helpers ──
static inline uint32_t ss_rgb(uint8_t r, uint8_t g, uint8_t b)
{
    return ((uint32_t)r << 16) | ((uint32_t)g << 8) | (uint32_t)b;
}

static inline void ss_unpack_rgb(uint32_t c, uint8_t *r, uint8_t *g, uint8_t *b)
{
    *r = (uint8_t)((c >> 16) & 0xFF);
    *g = (uint8_t)((c >> 8) & 0xFF);
    *b = (uint8_t)(c & 0xFF);
}

#endif /* SCREEN_SIMULATOR_H */
