/**
 * AMOLED Style Demo
 * 
 * Demonstrates the AMOLED screen simulation with pure blacks and high contrast.
 * Shows the characteristic deep blacks and vibrant colors of AMOLED displays.
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
    int pattern_phase;
    int color_cycle;
    float brightness_wave;
} AnimationState;

static void draw_amoled_test_pattern(ScreenSimulator *sim, AnimationState *anim)
{
    // Clear with pure black
    ss_clear(sim, 0, 0, 0);
    
    // Test pattern 1: Pure black regions
    for (int y = 0; y < SCREEN_HEIGHT / 4; y++) {
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            // Pure black - should not be visible on AMOLED
            ss_set_pixel(sim, x, y, 0, 0, 0, 255);
        }
    }
    
    // Test pattern 2: Gradient from pure black to full white
    for (int y = SCREEN_HEIGHT / 4; y < SCREEN_HEIGHT / 2; y++) {
        float progress = (y - SCREEN_HEIGHT / 4) / (float)(SCREEN_HEIGHT / 4);
        uint8_t brightness = (uint8_t)(progress * 255.0f);
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            ss_set_pixel(sim, x, y, brightness, brightness, brightness, 255);
        }
    }
    
    // Test pattern 3: Color bars
    int bar_width = SCREEN_WIDTH / 6;
    for (int i = 0; i < 6; i++) {
        uint8_t r = (i == 0) ? 255 : 0;
        uint8_t g = (i == 1) ? 255 : 0;
        uint8_t b = (i == 2) ? 255 : 0;
        uint8_t w = (i == 3) ? 255 : 0;
        
        for (int x = i * bar_width; x < (i + 1) * bar_width && x < SCREEN_WIDTH; x++) {
            for (int y = SCREEN_HEIGHT / 2; y < SCREEN_HEIGHT * 3 / 4; y++) {
                if (i == 4) ss_set_pixel(sim, x, y, w, w, w, 255);
                else if (i == 5) ss_set_pixel(sim, x, y, r, g, b, 255);
                else ss_set_pixel(sim, x, y, r, g, b, 255);
            }
        }
    }
    
    // Test pattern 4: Text display
    int text_y = SCREEN_HEIGHT * 3 / 4 + 2;
    const char *text = "AMOLED";
    int text_x = SCREEN_WIDTH / 2 - 3;
    
    for (int i = 0; i < 6; i++) {
        uint8_t brightness = 200 + (uint8_t)(55 * sin(anim->time * 2.0f + i * 0.5f));
        for (int j = 0; j < 6; j++) {
            if (j < 6) { // Character width
                ss_set_pixel(sim, text_x + i, text_y + j, brightness, brightness, brightness, 255);
            }
        }
    }
}

static void draw_amoled_colors(ScreenSimulator *sim, AnimationState *anim)
{
    // Clear with pure black
    ss_clear(sim, 0, 0, 0);
    
    anim->color_cycle = (anim->color_cycle + 1) % 360;
    
    // Create animated color wheel
    for (int y = 0; y < SCREEN_HEIGHT; y++) {
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            float angle = (x / (float)SCREEN_WIDTH) * 2.0f * M_PI + anim->time;
            float hue = (x / (float)SCREEN_WIDTH) * 360.0f + anim->color_cycle;
            
            // Convert HSV to RGB
            float c = 1.0f; // Chroma
            float hp = hue / 60.0f;
            int x_i = (int)hp;
            float x_f = hp - x_i;
            float p = c * (1.0f - x_f);
            float q = c * x_f;
            
            float r, g, b;
            if (x_i == 0) { r = c; g = q; b = p; }
            else if (x_i == 1) { r = q; g = c; b = p; }
            else if (x_i == 2) { r = p; g = c; b = q; }
            else if (x_i == 3) { r = p; g = q; b = c; }
            else if (x_i == 4) { r = q; g = p; b = c; }
            else { r = c; g = p; b = q; }
            
            // Apply brightness wave
            float wave = sin((y / (float)SCREEN_HEIGHT) * M_PI + anim->time * 2.0f);
            float brightness = (wave + 1.0f) * 0.5f;
            
            uint8_t rr = (uint8_t)(r * brightness * 255.0f);
            uint8_t gg = (uint8_t)(g * brightness * 255.0f);
            uint8_t bb = (uint8_t)(b * brightness * 255.0f);
            
            ss_set_pixel(sim, x, y, rr, gg, bb, 255);
        }
    }
    
    // Add some pure black elements to show AMOLED characteristics
    for (int i = 0; i < 10; i++) {
        int x = rand() % SCREEN_WIDTH;
        int y = rand() % SCREEN_HEIGHT;
        int size = 1 + rand() % 3;
        
        for (int dy = 0; dy < size; dy++) {
            for (int dx = 0; dx < size; dx++) {
                if (x + dx < SCREEN_WIDTH && y + dy < SCREEN_HEIGHT) {
                    ss_set_pixel(sim, x + dx, y + dy, 0, 0, 0, 255);
                }
            }
        }
    }
}

static void draw_amoled_contrast_test(ScreenSimulator *sim, AnimationState *anim)
{
    // Clear with pure black
    ss_clear(sim, 0, 0, 0);
    
    anim->brightness_wave = sin(anim->time * 1.5f) * 0.5f + 0.5f;
    
    // High contrast patterns
    for (int y = 0; y < SCREEN_HEIGHT; y++) {
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            // Create checkerboard pattern with varying contrast
            float checker = ((x / 4) + (y / 4)) % 2;
            float pattern = sin(x * 0.2f + anim->time) * sin(y * 0.15f + anim->time * 0.8f);
            
            float brightness = (checker + pattern * 0.5f) * 0.5f + 0.5f;
            brightness *= anim->brightness_wave;
            
            uint8_t value = (uint8_t)(brightness * 255.0f);
            
            // High contrast colors
            if ((x + y) % 3 == 0) {
                ss_set_pixel(sim, x, y, value, value, value, 255);
            } else if ((x + y) % 3 == 1) {
                ss_set_pixel(sim, x, y, value, 0, 0, 255);
            } else {
                ss_set_pixel(sim, x, y, 0, value, 0, 255);
            }
        }
    }
    
    // Add some text
    const char *text = "HIGH CONTRAST";
    int text_x = SCREEN_WIDTH / 2 - 7;
    int text_y = SCREEN_HEIGHT / 2 - 1;
    
    for (int i = 0; i < 13; i++) {
        uint8_t brightness = anim->brightness_wave * 255;
        for (int j = 0; j < 3; j++) {
            if (text_x + i < SCREEN_WIDTH && text_y + j < SCREEN_HEIGHT) {
                ss_set_pixel(sim, text_x + i, text_y + j, brightness, brightness, brightness, 255);
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
        .title = "AMOLED Style Demo",
        .style = "amoled"
    };
    
    ScreenSimulator *sim = ss_create(&config);
    if (!sim) {
        fprintf(stderr, "Failed to create screen simulator\n");
        return 1;
    }
    
    AnimationState anim = {0};
    int frame_count = 0;
    int test_mode = 0;
    
    printf("AMOLED Style Demo - Press ESC to exit\n");
    printf("Test modes: 0=Test pattern, 1=Color wheel, 2=High contrast\n");
    
    while (!ss_poll_quit(sim)) {
        anim.time += 1.0f / FPS;
        
        // Switch test modes
        if (frame_count % (FPS * 10) == 0) {
            test_mode = (test_mode + 1) % 3;
            printf("Switching to test mode %d\n", test_mode);
        }
        
        // Draw appropriate test
        if (test_mode == 0) {
            draw_amoled_test_pattern(sim, &anim);
        } else if (test_mode == 1) {
            draw_amoled_colors(sim, &anim);
        } else {
            draw_amoled_contrast_test(sim, &anim);
        }
        
        ss_tick(sim);
        ss_render(sim);
        ss_delay_ms(sim, 1000 / FPS);
        
        frame_count++;
    }
    
    ss_destroy(sim);
    return 0;
}
