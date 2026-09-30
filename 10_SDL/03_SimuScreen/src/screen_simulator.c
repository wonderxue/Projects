/**
 * Screen Simulator - Main Implementation
 * 
 * Main implementation with abstract interface and style-specific renderers.
 */

#include "screen_simulator.h"

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include <SDL3/SDL.h>
#include "lvgl.h"

// ── Common SDL/LVGL functions ──
static void lv_flush_cb(lv_display_t *disp, const lv_area_t *area, uint8_t *px_map)
{
    (void)area;
    (void)px_map;
    lv_display_flush_ready(disp);
}

static int init_sdl_lvgl(ScreenSimulator *sim)
{
    // Initialize SDL
    if (!SDL_Init(SDL_INIT_VIDEO)) {
        fprintf(stderr, "SDL_Init: %s\n", SDL_GetError());
        return 0;
    }

    // Create window
    sim->sdl_window = SDL_CreateWindow(sim->config.title ? sim->config.title : "Screen Simulator",
                                     sim->config.width * sim->config.pixel_size + 2 * sim->config.margin,
                                     sim->config.height * sim->config.pixel_size + 2 * sim->config.margin,
                                     0);
    if (!sim->sdl_window) {
        fprintf(stderr, "SDL_CreateWindow: %s\n", SDL_GetError());
        return 0;
    }

    // Create renderer
    sim->sdl_renderer = SDL_CreateRenderer(sim->sdl_window, NULL);
    if (!sim->sdl_renderer) {
        fprintf(stderr, "SDL_CreateRenderer: %s\n", SDL_GetError());
        return 0;
    }

    // Initialize LVGL
    lv_init();
    sim->lv_display = lv_display_create(sim->config.width, sim->config.height);
    lv_display_set_flush_cb(sim->lv_display, lv_flush_cb);

    // Allocate LVGL buffer
    uint32_t buf_size = (uint32_t)sim->config.width * 10 * sizeof(lv_color_t);
    sim->lv_buffer = malloc(buf_size);
    if (!sim->lv_buffer) {
        fprintf(stderr, "lvgl buffer alloc failed\n");
        return 0;
    }
    lv_display_set_buffers(sim->lv_display, sim->lv_buffer, NULL, buf_size,
                          LV_DISPLAY_RENDER_MODE_PARTIAL);

    sim->last_tick = SDL_GetTicks();
    return 1;
}

// ── Pixel Style Implementation ──
typedef struct {
    int grid_color_r, grid_color_g, grid_color_b;
} PixelStyleData;

static void pixel_render(ScreenSimulator *sim)
{
    PixelStyleData *style = (PixelStyleData*)sim->style_data;
    
    // Panel background
    SDL_SetRenderDrawColor(sim->sdl_renderer, 5, 5, 15, 255);
    SDL_RenderClear(sim->sdl_renderer);

    int ox = sim->config.margin;
    int oy = sim->config.margin;
    int psz = sim->config.pixel_size;

    // Draw pixels
    for (int y = 0; y < sim->config.height; y++) {
        for (int x = 0; x < sim->config.width; x++) {
            uint8_t r, g, b;
            ss_unpack_rgb(sim->framebuffer[y * sim->config.width + x], &r, &g, &b);
            SDL_SetRenderDrawColor(sim->sdl_renderer, r, g, b, 255);
            SDL_FRect rect = {
                (float)(ox + x * psz),
                (float)(oy + y * psz),
                (float)psz, (float)psz
            };
            SDL_RenderFillRect(sim->sdl_renderer, &rect);
        }
    }

    // Grid overlay
    SDL_SetRenderDrawColor(sim->sdl_renderer, 
                           style->grid_color_r, style->grid_color_g, style->grid_color_b, 255);
    for (int x = 0; x <= sim->config.width; x++) {
        SDL_RenderLine(sim->sdl_renderer,
                       (float)(ox + x * psz), (float)oy,
                       (float)(ox + x * psz), (float)(oy + sim->config.height * psz));
    }
    for (int y = 0; y <= sim->config.height; y++) {
        SDL_RenderLine(sim->sdl_renderer,
                       (float)ox, (float)(oy + y * psz),
                       (float)(ox + sim->config.width * psz), (float)(oy + y * psz));
    }

    SDL_RenderPresent(sim->sdl_renderer);
}

static void pixel_clear(ScreenSimulator *sim, uint8_t r, uint8_t g, uint8_t b)
{
    uint32_t c = ss_rgb(r, g, b) | 0xFF000000;
    int n = sim->config.width * sim->config.height;
    for (int i = 0; i < n; i++) sim->framebuffer[i] = c;
}

static void pixel_set_pixel(ScreenSimulator *sim, int x, int y, uint8_t r, uint8_t g, uint8_t b, uint8_t a)
{
    if (x < 0 || x >= sim->config.width || y < 0 || y >= sim->config.height) return;
    uint32_t *dst = &sim->framebuffer[y * sim->config.width + x];
    if (a == 255) {
        *dst = ss_rgb(r, g, b) | 0xFF000000;
    } else if (a > 0) {
        uint32_t bg = *dst;
        uint8_t br, bg8, bb;
        ss_unpack_rgb(bg, &br, &bg8, &bb);
        int inv = 255 - a;
        *dst = ss_rgb((uint8_t)((r * a + br * inv) / 255),
                      (uint8_t)((g * a + bg8 * inv) / 255),
                      (uint8_t)((b * a + bb * inv) / 255)) | 0xFF000000;
    }
}

static void pixel_fade(ScreenSimulator *sim, int num, int denom)
{
    int n = sim->config.width * sim->config.height;
    for (int i = 0; i < n; i++) {
        uint8_t r, g, b;
        ss_unpack_rgb(sim->framebuffer[i], &r, &g, &b);
        sim->framebuffer[i] = ss_rgb((uint8_t)(r * num / denom),
                                   (uint8_t)(g * num / denom),
                                   (uint8_t)(b * num / denom)) | 0xFF000000;
    }
}

void ss_register_pixel_style(ScreenSimulator *sim)
{
    PixelStyleData *style = malloc(sizeof(PixelStyleData));
    style->grid_color_r = 25;
    style->grid_color_g = 25;
    style->grid_color_b = 35;
    sim->style_data = style;
    sim->render = pixel_render;
    sim->clear = pixel_clear;
    sim->set_pixel = pixel_set_pixel;
    sim->fade = pixel_fade;
}

// ── Glow Tube Style Implementation ──
typedef struct {
    float glow_intensity;
    float bloom_threshold;
    uint8_t tube_r, tube_g, tube_b;
    uint8_t glow_r, glow_g, glow_b;
} GlowStyleData;

static void glow_render(ScreenSimulator *sim)
{
    GlowStyleData *style = (GlowStyleData*)sim->style_data;
    
    // Dark background
    SDL_SetRenderDrawColor(sim->sdl_renderer, 0, 0, 5, 255);
    SDL_RenderClear(sim->sdl_renderer);

    int ox = sim->config.margin;
    int oy = sim->config.margin;
    int psz = sim->config.pixel_size;

    // Create glow effect for bright pixels
    for (int y = 0; y < sim->config.height; y++) {
        for (int x = 0; x < sim->config.width; x++) {
            uint8_t r, g, b;
            ss_unpack_rgb(sim->framebuffer[y * sim->config.width + x], &r, &g, &b);
            
            float brightness = (r + g + b) / 3.0f / 255.0f;
            
            if (brightness > style->bloom_threshold) {
                // Draw glow halo
                float glow_size = psz * (1.0f + style->glow_intensity * brightness);
                int glow_radius = (int)(glow_size / 2.0f);
                
                for (int dy = -glow_radius; dy <= glow_radius; dy++) {
                    for (int dx = -glow_radius; dx <= glow_radius; dx++) {
                        float dist = sqrt(dx*dx + dy*dy);
                        if (dist <= glow_radius) {
                            int px = ox + x * psz + dx;
                            int py = oy + y * psz + dy;
                            if (px >= 0 && px < sim->config.width * psz + 2*ox &&
                                py >= 0 && py < sim->config.height * psz + 2*oy) {
                                
                                float alpha = (1.0f - dist / glow_radius) * brightness * 0.3f;
                                SDL_SetRenderDrawColor(sim->sdl_renderer,
                                                      (uint8_t)(style->glow_r * alpha),
                                                      (uint8_t)(style->glow_g * alpha),
                                                      (uint8_t)(style->glow_b * alpha), 255);
                                SDL_RenderPoint(sim->sdl_renderer, (float)px, (float)py);
                            }
                        }
                    }
                }
            }
            
            // Draw main pixel
            SDL_SetRenderDrawColor(sim->sdl_renderer, r, g, b, 255);
            SDL_FRect rect = {
                (float)(ox + x * psz),
                (float)(oy + y * psz),
                (float)psz, (float)psz
            };
            SDL_RenderFillRect(sim->sdl_renderer, &rect);
        }
    }

    SDL_RenderPresent(sim->sdl_renderer);
}

static void glow_clear(ScreenSimulator *sim, uint8_t r, uint8_t g, uint8_t b)
{
    uint32_t c = ss_rgb(r, g, b) | 0xFF000000;
    int n = sim->config.width * sim->config.height;
    for (int i = 0; i < n; i++) sim->framebuffer[i] = c;
}

static void glow_set_pixel(ScreenSimulator *sim, int x, int y, uint8_t r, uint8_t g, uint8_t b, uint8_t a)
{
    if (x < 0 || x >= sim->config.width || y < 0 || y >= sim->config.height) return;
    uint32_t *dst = &sim->framebuffer[y * sim->config.width + x];
    if (a == 255) {
        *dst = ss_rgb(r, g, b) | 0xFF000000;
    } else if (a > 0) {
        uint32_t bg = *dst;
        uint8_t br, bg8, bb;
        ss_unpack_rgb(bg, &br, &bg8, &bb);
        int inv = 255 - a;
        *dst = ss_rgb((uint8_t)((r * a + br * inv) / 255),
                      (uint8_t)((g * a + bg8 * inv) / 255),
                      (uint8_t)((b * a + bb * inv) / 255)) | 0xFF000000;
    }
}

static void glow_fade(ScreenSimulator *sim, int num, int denom)
{
    int n = sim->config.width * sim->config.height;
    for (int i = 0; i < n; i++) {
        uint8_t r, g, b;
        ss_unpack_rgb(sim->framebuffer[i], &r, &g, &b);
        sim->framebuffer[i] = ss_rgb((uint8_t)(r * num / denom),
                                   (uint8_t)(g * num / denom),
                                   (uint8_t)(b * num / denom)) | 0xFF000000;
    }
}

void ss_register_glow_style(ScreenSimulator *sim)
{
    GlowStyleData *style = malloc(sizeof(GlowStyleData));
    style->glow_intensity = 1.5f;
    style->bloom_threshold = 0.3f;
    style->tube_r = 255;
    style->tube_g = 100;
    style->tube_b = 50;
    style->glow_r = 255;
    style->glow_g = 150;
    style->glow_b = 100;
    sim->style_data = style;
    sim->render = glow_render;
    sim->clear = glow_clear;
    sim->set_pixel = glow_set_pixel;
    sim->fade = glow_fade;
}

// ── AMOLED Style Implementation ──
typedef struct {
    uint8_t black_level;
    uint8_t contrast;
    float color_shift;
} AMOLEDStyleData;

static void amoled_render(ScreenSimulator *sim)
{
    AMOLEDStyleData *style = (AMOLEDStyleData*)sim->style_data;
    
    // Pure black background
    SDL_SetRenderDrawColor(sim->sdl_renderer, 0, 0, 0, 255);
    SDL_RenderClear(sim->sdl_renderer);

    int ox = sim->config.margin;
    int oy = sim->config.margin;
    int psz = sim->config.pixel_size;

    for (int y = 0; y < sim->config.height; y++) {
        for (int x = 0; x < sim->config.width; x++) {
            uint8_t r, g, b;
            ss_unpack_rgb(sim->framebuffer[y * sim->config.width + x], &r, &g, &b);
            
            // Apply AMOLED characteristics
            float brightness = (r + g + b) / 3.0f / 255.0f;
            
            // Pure black pixels stay completely black
            if (brightness < style->black_level / 255.0f) {
                continue; // Don't render - pure black
            }
            
            // Apply contrast
            float contrast_factor = style->contrast / 100.0f;
            r = (uint8_t)(pow(r / 255.0f, 1.0f / contrast_factor) * 255.0f);
            g = (uint8_t)(pow(g / 255.0f, 1.0f / contrast_factor) * 255.0f);
            b = (uint8_t)(pow(b / 255.0f, 1.0f / contrast_factor) * 255.0f);
            
            // Apply color shift for AMOLED effect
            if (style->color_shift > 0) {
                float shift = style->color_shift * brightness;
                r = (uint8_t)(r * (1.0f - shift * 0.1f));
                g = (uint8_t)(g * (1.0f - shift * 0.05f));
                b = (uint8_t)(b * (1.0f + shift * 0.1f));
            }
            
            SDL_SetRenderDrawColor(sim->sdl_renderer, r, g, b, 255);
            SDL_FRect rect = {
                (float)(ox + x * psz),
                (float)(oy + y * psz),
                (float)psz, (float)psz
            };
            SDL_RenderFillRect(sim->sdl_renderer, &rect);
        }
    }

    SDL_RenderPresent(sim->sdl_renderer);
}

static void amoled_clear(ScreenSimulator *sim, uint8_t r, uint8_t g, uint8_t b)
{
    uint32_t c = ss_rgb(r, g, b) | 0xFF000000;
    int n = sim->config.width * sim->config.height;
    for (int i = 0; i < n; i++) sim->framebuffer[i] = c;
}

static void amoled_set_pixel(ScreenSimulator *sim, int x, int y, uint8_t r, uint8_t g, uint8_t b, uint8_t a)
{
    if (x < 0 || x >= sim->config.width || y < 0 || y >= sim->config.height) return;
    uint32_t *dst = &sim->framebuffer[y * sim->config.width + x];
    if (a == 255) {
        *dst = ss_rgb(r, g, b) | 0xFF000000;
    } else if (a > 0) {
        uint32_t bg = *dst;
        uint8_t br, bg8, bb;
        ss_unpack_rgb(bg, &br, &bg8, &bb);
        int inv = 255 - a;
        *dst = ss_rgb((uint8_t)((r * a + br * inv) / 255),
                      (uint8_t)((g * a + bg8 * inv) / 255),
                      (uint8_t)((b * a + bb * inv) / 255)) | 0xFF000000;
    }
}

static void amoled_fade(ScreenSimulator *sim, int num, int denom)
{
    int n = sim->config.width * sim->config.height;
    for (int i = 0; i < n; i++) {
        uint8_t r, g, b;
        ss_unpack_rgb(sim->framebuffer[i], &r, &g, &b);
        sim->framebuffer[i] = ss_rgb((uint8_t)(r * num / denom),
                                   (uint8_t)(g * num / denom),
                                   (uint8_t)(b * num / denom)) | 0xFF000000;
    }
}

void ss_register_amoled_style(ScreenSimulator *sim)
{
    AMOLEDStyleData *style = malloc(sizeof(AMOLEDStyleData));
    style->black_level = 10;
    style->contrast = 120;
    style->color_shift = 0.1f;
    sim->style_data = style;
    sim->render = amoled_render;
    sim->clear = amoled_clear;
    sim->set_pixel = amoled_set_pixel;
    sim->fade = amoled_fade;
}

// ── Main Interface Implementation ──
ScreenSimulator* ss_create(const ScreenConfig *config)
{
    ScreenSimulator *sim = malloc(sizeof(ScreenSimulator));
    if (!sim) return NULL;
    
    sim->config = *config;
    sim->framebuffer = calloc((size_t)config->width * (size_t)config->height, sizeof(uint32_t));
    if (!sim->framebuffer) {
        free(sim);
        return NULL;
    }
    
    if (!init_sdl_lvgl(sim)) {
        free(sim->framebuffer);
        free(sim);
        return NULL;
    }
    
    sim->running = true;
    
    // Register default style based on config
    if (strcmp(config->style, "pixel") == 0) {
        ss_register_pixel_style(sim);
    } else if (strcmp(config->style, "glow") == 0) {
        ss_register_glow_style(sim);
    } else if (strcmp(config->style, "amoled") == 0) {
        ss_register_amoled_style(sim);
    } else {
        // Default to pixel style
        ss_register_pixel_style(sim);
    }
    
    return sim;
}

void ss_destroy(ScreenSimulator *sim)
{
    if (!sim) return;
    
    free(sim->lv_buffer);
    free(sim->style_data);
    free(sim->framebuffer);
    
    if (sim->sdl_renderer) SDL_DestroyRenderer(sim->sdl_renderer);
    if (sim->sdl_window) SDL_DestroyWindow(sim->sdl_window);
    SDL_Quit();
    
    free(sim);
}

bool ss_poll_quit(ScreenSimulator *sim)
{
    SDL_Event e;
    bool quit = false;
    while (SDL_PollEvent(&e)) {
        if (e.type == SDL_EVENT_QUIT) quit = true;
        else if (e.type == SDL_EVENT_KEY_DOWN &&
                 e.key.key == SDLK_ESCAPE) quit = true;
    }
    return quit;
}

void ss_tick(ScreenSimulator *sim)
{
    uint64_t now = SDL_GetTicks();
    lv_tick_inc((uint32_t)(now - sim->last_tick));
    sim->last_tick = now;
    lv_timer_handler();
}

void ss_render(ScreenSimulator *sim)
{
    if (sim->render) {
        sim->render(sim);
    }
}

void ss_delay_ms(ScreenSimulator *sim, uint32_t ms)
{
    SDL_Delay(ms);
}

// ── Wrapper functions ──
void ss_set_pixel(ScreenSimulator *sim, int x, int y, uint8_t r, uint8_t g, uint8_t b, uint8_t a)
{
    if (sim->set_pixel) {
        sim->set_pixel(sim, x, y, r, g, b, a);
    }
}

void ss_clear(ScreenSimulator *sim, uint8_t r, uint8_t g, uint8_t b)
{
    if (sim->clear) {
        sim->clear(sim, r, g, b);
    }
}

void ss_fade(ScreenSimulator *sim, int num, int denom)
{
    if (sim->fade) {
        sim->fade(sim, num, denom);
    }
}
