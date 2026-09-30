/**
 * Glow Tube Style Demo
 * 
 * Demonstrates the vacuum tube/glow tube screen simulation with bloom effects.
 * Shows glowing particles and light emission effects typical of old displays.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#include "../src/screen_simulator.h"

#define SCREEN_WIDTH 64
#define SCREEN_HEIGHT 32
#define PIXEL_SIZE 10
#define MARGIN 15
#define FPS 60

// ── Particle system ──
typedef struct {
    float x, y;
    float vx, vy;
    float life;
    float max_life;
    uint8_t r, g, b;
    float glow_intensity;
} GlowParticle;

// ── Animation state ──
typedef struct {
    float time;
    int particle_count;
    GlowParticle particles[200];
    int burst_timer;
    int wave_phase;
} AnimationState;

static void create_burst(AnimationState *anim, int x, int y, uint8_t r, uint8_t g, uint8_t b)
{
    for (int i = 0; i < 20; i++) {
        if (anim->particle_count < 200) {
            GlowParticle *p = &anim->particles[anim->particle_count++];
            
            float angle = (i / 20.0f) * 2.0f * M_PI + (rand() % 100) * 0.1f;
            float speed = 2.0f + (rand() % 100) * 0.05f;
            
            p->x = x;
            p->y = y;
            p->vx = cos(angle) * speed;
            p->vy = sin(angle) * speed;
            p->life = 1.0f;
            p->max_life = 1.0f + (rand() % 100) * 0.02f;
            p->r = r;
            p->g = g;
            p->b = b;
            p->glow_intensity = 0.5f + (rand() % 100) * 0.01f;
        }
    }
}

static void update_particles(AnimationState *anim)
{
    for (int i = 0; i < anim->particle_count; i++) {
        GlowParticle *p = &anim->particles[i];
        
        // Update position
        p->x += p->vx;
        p->y += p->vy;
        
        // Apply gravity
        p->vy += 0.05f;
        
        // Apply friction
        p->vx *= 0.98f;
        p->vy *= 0.98f;
        
        // Update life
        p->life -= 0.01f;
        
        // Remove dead particles
        if (p->life <= 0) {
            anim->particles[i] = anim->particles[anim->particle_count - 1];
            anim->particle_count--;
            i--;
        }
    }
}

static void draw_glow_effects(ScreenSimulator *sim, AnimationState *anim)
{
    // Clear screen with dark background
    ss_clear(sim, 5, 5, 15);
    
    // Draw background glow effect
    for (int y = 0; y < SCREEN_HEIGHT; y++) {
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            float dist_from_center = sqrt((x - SCREEN_WIDTH/2) * (x - SCREEN_WIDTH/2) + 
                                       (y - SCREEN_HEIGHT/2) * (y - SCREEN_HEIGHT/2));
            float glow = (1.0f - dist_from_center / (SCREEN_WIDTH * 0.7f)) * 0.1f;
            if (glow > 0) {
                uint8_t r = (uint8_t)(glow * 50);
                uint8_t g = (uint8_t)(glow * 30);
                uint8_t b = (uint8_t)(glow * 10);
                ss_set_pixel(sim, x, y, r, g, b, 100);
            }
        }
    }
    
    // Draw particles
    for (int i = 0; i < anim->particle_count; i++) {
        GlowParticle *p = &anim->particles[i];
        
        // Calculate particle brightness based on life
        float brightness = p->life / p->max_life;
        
        // Draw particle with glow
        int px = (int)p->x;
        int py = (int)p->y;
        
        if (px >= 0 && px < SCREEN_WIDTH && py >= 0 && py < SCREEN_HEIGHT) {
            // Main particle
            ss_set_pixel(sim, px, py, 
                        (uint8_t)(p->r * brightness),
                        (uint8_t)(p->g * brightness), 
                        (uint8_t)(p->b * brightness), 255);
            
            // Glow effect around particle
            for (int dy = -2; dy <= 2; dy++) {
                for (int dx = -2; dx <= 2; dx++) {
                    if (dx == 0 && dy == 0) continue;
                    
                    int glow_x = px + dx;
                    int glow_y = py + dy;
                    float dist = sqrt(dx*dx + dy*dy);
                    float glow_alpha = (1.0f - dist / 3.0f) * brightness * p->glow_intensity * 0.3f;
                    
                    if (glow_x >= 0 && glow_x < SCREEN_WIDTH && 
                        glow_y >= 0 && glow_y < SCREEN_HEIGHT && glow_alpha > 0) {
                        ss_set_pixel(sim, glow_x, glow_y,
                                    (uint8_t)(p->r * glow_alpha),
                                    (uint8_t)(p->g * glow_alpha),
                                    (uint8_t)(p->b * glow_alpha), 255);
                    }
                }
            }
        }
    }
    
    // Create new bursts periodically
    anim->burst_timer++;
    if (anim->burst_timer > 30) {
        anim->burst_timer = 0;
        
        // Random burst location
        int burst_x = rand() % SCREEN_WIDTH;
        int burst_y = rand() % SCREEN_HEIGHT;
        
        // Random color
        uint8_t r = 100 + rand() % 155;
        uint8_t g = 50 + rand() % 100;
        uint8_t b = 0 + rand() % 50;
        
        create_burst(anim, burst_x, burst_y, r, g, b);
    }
}

static void draw_tube_display(ScreenSimulator *sim, AnimationState *anim)
{
    // Clear screen
    ss_clear(sim, 0, 0, 5);
    
    // Draw tube-like display
    anim->wave_phase = (anim->wave_phase + 1) % 360;
    
    // Create wave patterns
    for (int y = 0; y < SCREEN_HEIGHT; y++) {
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            float wave1 = sin((x * 0.1f + anim->time * 2.0f + anim->wave_phase * 0.01f) * M_PI);
            float wave2 = sin((y * 0.08f + anim->time * 1.5f) * M_PI);
            float combined = (wave1 + wave2) * 0.5f + 0.5f;
            
            // Tube-like glow effect
            uint8_t r = (uint8_t)(combined * 255.0f);
            uint8_t g = (uint8_t)(combined * 200.0f);
            uint8_t b = (uint8_t)(combined * 100.0f);
            
            ss_set_pixel(sim, x, y, r, g, b, 255);
        }
    }
    
    // Add scan lines effect
    for (int y = 0; y < SCREEN_HEIGHT; y += 2) {
        for (int x = 0; x < SCREEN_WIDTH; x++) {
            uint8_t intensity = (uint8_t)(50 + 30 * sin(anim->time * 3.0f + x * 0.1f));
            ss_set_pixel(sim, x, y, intensity, intensity, intensity, 100);
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
        .title = "Glow Tube Style Demo",
        .style = "glow"
    };
    
    ScreenSimulator *sim = ss_create(&config);
    if (!sim) {
        fprintf(stderr, "Failed to create screen simulator\n");
        return 1;
    }
    
    AnimationState anim = {0};
    int frame_count = 0;
    int display_mode = 0;
    
    printf("Glow Tube Style Demo - Press ESC to exit\n");
    printf("Display modes: 0=Particle effects, 1=Tube display\n");
    
    while (!ss_poll_quit(sim)) {
        anim.time += 1.0f / FPS;
        
        // Switch display modes
        if (frame_count % (FPS * 8) == 0) {
            display_mode = (display_mode + 1) % 2;
            printf("Switching to display mode %d\n", display_mode);
            anim.particle_count = 0; // Reset particles when switching
        }
        
        // Update and draw appropriate display
        if (display_mode == 0) {
            update_particles(&anim);
            draw_glow_effects(sim, &anim);
        } else {
            draw_tube_display(sim, &anim);
        }
        
        ss_tick(sim);
        ss_render(sim);
        ss_delay_ms(sim, 1000 / FPS);
        
        frame_count++;
    }
    
    ss_destroy(sim);
    return 0;
}
