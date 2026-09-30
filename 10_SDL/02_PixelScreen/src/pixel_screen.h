/**
 * Pixel Screen Simulator - core module
 *
 * Simulates a low-resolution LED-style pixel screen on top of SDL3.
 * The logical framebuffer is px_x * px_y RGB pixels; each logical pixel
 * is drawn as a pixel_size x pixel_size block with a subtle grid overlay.
 *
 * LVGL is initialised alongside SDL so demos can build LVGL UIs that
 * share the same logical resolution (flush into fb or use it standalone).
 *
 * Typical frame loop:
 *   if (ps_poll_quit()) break;
 *   ps_tick();
 *   ... draw into fb via ps_set_pixel()/ps_fade() ...
 *   ps_render(&scr);
 *   ps_delay_ms(1000 / FPS);
 */
#ifndef PIXEL_SCREEN_H
#define PIXEL_SCREEN_H

#include <stdint.h>

typedef struct {
    int pixel_size;   /* screen pixels per logical pixel        */
    int px_x, px_y;   /* logical resolution                     */
    int margin;       /* margin around the pixel grid (scr px)  */
    int win_w, win_h; /* resulting SDL window size              */
    uint32_t *fb;     /* 0xRRGGBBAA, px_x * px_y, row-major     */
} PixelScreen;

/* ── Lifecycle ── */
int  ps_init(PixelScreen *ps, int px_x, int px_y,
             int pixel_size, int margin, const char *title);
void ps_destroy(PixelScreen *ps);

/* ── Per-frame ── */
int  ps_poll_quit(void);             /* pump events; 1 = quit requested (ESC/close) */
void ps_tick(void);                  /* advance LVGL tick, run LVGL timer handler   */
void ps_render(const PixelScreen *ps); /* draw the framebuffer to the window        */
void ps_delay_ms(uint32_t ms);       /* frame pacing helper                         */

/* ── Framebuffer ops ── */
void ps_set_pixel(PixelScreen *ps, int x, int y,
                  uint8_t r, uint8_t g, uint8_t b, uint8_t a);
void ps_clear(PixelScreen *ps, uint8_t r, uint8_t g, uint8_t b);
void ps_fade(PixelScreen *ps, int num, int denom); /* fb *= num/denom (trails) */

/* ── Color helpers ── */
static inline uint32_t ps_rgb(uint8_t r, uint8_t g, uint8_t b)
{
    return ((uint32_t)r << 16) | ((uint32_t)g << 8) | (uint32_t)b;
}

static inline void ps_unpack_rgb(uint32_t c, uint8_t *r, uint8_t *g, uint8_t *b)
{
    *r = (uint8_t)((c >> 16) & 0xFF);
    *g = (uint8_t)((c >> 8) & 0xFF);
    *b = (uint8_t)(c & 0xFF);
}

#endif /* PIXEL_SCREEN_H */
