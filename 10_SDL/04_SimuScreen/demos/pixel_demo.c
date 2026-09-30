/**
 * Pixel Style Demo
 * 
 * Demonstrates the pixelized LED-style screen simulation with grid overlay.
 * Shows animated patterns that highlight the pixel grid characteristics.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#include "../src/screen_simulator.h"

#define SCREEN_WIDTH 64
#define SCREEN_HEIGHT 32
#define PIXEL_SIZE 8
#define MARGIN 10
#define FPS 60

// ── Animation state ──
typedef struct {
    float time;
    int wave_phase;
    int pattern_phase;
} AnimationState;

static void draw_pixel_pattern(ScreenSimulator *sim, AnimationState *anim)
{
    // Clear screen
    ss_clear(sim, 0, 0, 20);
    
    // Animated wave pattern
    for (int y = 0; y < SCREEN_HEIGHT; y++) {
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            float wave1 = sin((x * 0.2f + anim->time * 2.0f) * M_PI);
            float wave2 = sin((y * 0.15f + anim->time * 1.5f) * M_PI);
            float brightness = (wave1 + wave2) * 0.5f + 0.5f;
            
            // Create colorful pattern
            uint8_t r = (uint8_t)(brightness * 255.0f);
            uint8_t g = (uint8_t)(brightness * 150.0f);
            uint8_t b = (uint8_t)(brightness * 100.0f);
            
            ss_set_pixel(sim, x, y, r, g, b, 255);
        }
    }
    
    // Draw animated text
    int text_x = SCREEN_WIDTH / 2 - 15;
    int text_y = SCREEN_HEIGHT / 2 - 2;
    
    for (int i = 0; i < 30; i++) {
        float char_brightness = sin((i * 0.3f + anim->time * 3.0f) * M_PI);
        uint8_t brightness = (uint8_t)((char_brightness + 1.0f) * 0.5f * 255.0f);
        ss_set_pixel(sim, text_x + i, text_y, brightness, brightness, 255, 255);
    }
    
    // Draw border
    for (int x = 0; x < SCREEN_WIDTH; x++) {
        ss_set_pixel(sim, x, 0, 100, 100, 150, 255);
        ss_set_pixel(sim, x, SCREEN_HEIGHT - 1, 100, 100, 150, 255);
    }
    for (int y = 0; y < SCREEN_HEIGHT; y++) {
        ss_set_pixel(sim, 0, y, 100, 100, 150, 255);
        ss_set_pixel(sim, SCREEN_WIDTH - 1, y, 100, 100, 150, 255);
    }
}

static void draw_test_pattern(ScreenSimulator *sim, AnimationState *anim)
{
    // Clear screen
    ss_clear(sim, 10, 10, 30);
    
    // Draw test patterns
    anim->pattern_phase = (anim->pattern_phase + 1) % 300;
    
    if (anim->pattern_phase < 100) {
        // Color gradient test
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            for (int y = 0; y < SCREEN_HEIGHT; y++) {
                uint8_t r = (uint8_t)((x * 255) / SCREEN_WIDTH);
                uint8_t g = (uint8_t)((y * 255) / SCREEN_HEIGHT);
                uint8_t b = (uint8_t)(((x + y) * 255) / (SCREEN_WIDTH + SCREEN_HEIGHT));
                ss_set_pixel(sim, x, y, r, g, b, 255);
            }
        }
    } else if (anim->pattern_phase < 200) {
        // Random noise pattern
        for (int i = 0; i < 1000; i++) {
            int x = rand() % SCREEN_WIDTH;
            int y = rand() % SCREEN_HEIGHT;
            uint8_t r = rand() % 256;
            uint8_t g = rand() % 256;
            uint8_t b = rand() % 256;
            ss_set_pixel(sim, x, y, r, g, b, 255);
        }
    } else {
        // Geometric pattern
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            for (int y = 0; y < SCREEN_HEIGHT; y++) {
                float dist = sqrt((x - SCREEN_WIDTH/2) * (x - SCREEN_WIDTH/2) + 
                                (y - SCREEN_HEIGHT/2) * (y - SCREEN_HEIGHT/2));
                uint8_t brightness = (uint8_t)((sin(dist * 0.1f + anim->time * 2.0f) + 1.0f) * 0.5f * 255.0f);
                ss_set_pixel(sim, x, y, brightness, brightness, brightness, 255);
            }
        }
    }
}

int main(void)
{
    ScreenConfig config = {
        .width = SCREEN_WIDTH,
        .height = SCREEN_HEIGHT,
        .pixel_size = PIXEL_SIZE,
        .margin = MARGIN,
        .title = "Pixel Style Demo",
        .style = "pixel"
    };
    
    ScreenSimulator *sim = ss_create(&config);
    if (!sim) {
        fprintf(stderr, "Failed to create screen simulator\n");
        return 1;
    }
    
    AnimationState anim = {0};
    int frame_count = 0;
    int pattern_mode = 0;
    
    printf("Pixel Style Demo - Press ESC to exit\n");
    printf("Pattern modes: 0=Animated, 1=Test patterns\n");
    
    while (!ss_poll_quit(sim)) {
        anim.time += 1.0f / FPS;
        
        // Switch pattern modes
        if (frame_count % (FPS * 10) == 0) {
            pattern_mode = (pattern_mode + 1) % 2;
            printf("Switching to pattern mode %d\n", pattern_mode);
        }
        
        // Draw appropriate pattern
        if (pattern_mode == 0) {
            draw_pixel_pattern(sim, &anim);
        } else {
            draw_test_pattern(sim, &anim);
        }
        
        ss_tick(sim);
        ss_render(sim);
        ss_delay_ms(sim, 1000 / FPS);
        
        frame_count++;
    }
    
    ss_destroy(sim);
    return 0;
}
