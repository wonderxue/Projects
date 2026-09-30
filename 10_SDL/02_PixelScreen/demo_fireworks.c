/**
 * Fireworks demo for the Pixel Screen simulator.
 *
 * Rockets rise from the bottom, explode into gravity-affected particle
 * bursts with per-particle color variance, and leave fading trails.
 *
 * Configurable at compile time (defaults below):
 *   PIXEL_SIZE, SCREEN_PIXELS_X, SCREEN_PIXELS_Y, MARGIN
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#include "src/pixel_screen.h"

/* ── Configuration (defaults, overridable via CMake -D) ── */
#ifndef PIXEL_SIZE
#define PIXEL_SIZE       8
#endif
#ifndef SCREEN_PIXELS_X
#define SCREEN_PIXELS_X  64
#endif
#ifndef SCREEN_PIXELS_Y
#define SCREEN_PIXELS_Y  32
#endif
#ifndef MARGIN
#define MARGIN           10
#endif

#define MAX_FIREWORKS    12
#define PARTICLES_PER_FW 80
#define GRAVITY          0.04f
#define FPS              120

/* ── Particle / firework types ── */
typedef struct {
    float x, y;
    float vx, vy;
    float life;                   /* 1.0 -> 0.0 */
    float decay;
    uint32_t color;               /* 0xRRGGBB packed */
} Particle;

typedef struct {
    float  x, y;                  /* rocket position / explosion origin */
    float  vy;                    /* rocket upward speed                */
    int    phase;                 /* 0 = rising, 1 = exploded, 2 = done */
    Particle parts[PARTICLES_PER_FW];
    uint32_t base_color;          /* hue base for this firework         */
} Firework;

static PixelScreen scr;
static Firework    fw[MAX_FIREWORKS];
static int         fw_count;

static inline uint8_t clamp8(int v) { return v < 0 ? 0 : (v > 255 ? 255 : (uint8_t)v); }

/* Vivid random color via HSV -> RGB (S=1, V=1) */
static uint32_t random_hue(void)
{
    int h = rand() % 360;
    float c = 1.0f;
    float x = c * (1.0f - fabsf(fmodf(h / 60.0f, 2.0f) - 1.0f));
    float r1, g1, b1;
    if      (h < 60)  { r1=c; g1=x; b1=0; }
    else if (h < 120) { r1=x; g1=c; b1=0; }
    else if (h < 180) { r1=0; g1=c; b1=x; }
    else if (h < 240) { r1=0; g1=x; b1=c; }
    else if (h < 300) { r1=x; g1=0; b1=c; }
    else              { r1=c; g1=0; b1=x; }
    return ps_rgb((uint8_t)(r1 * 255), (uint8_t)(g1 * 255), (uint8_t)(b1 * 255));
}

static void spawn_firework(void)
{
    if (fw_count >= MAX_FIREWORKS) return;
    Firework *f = &fw[fw_count++];
    f->x = 5.0f + (float)(rand() % (scr.px_x - 10));
    f->y = (float)(scr.px_y - 1);
    f->vy = -(0.6f + (float)(rand() % 40) / 100.0f);  /* upward 0.6..1.0 */
    f->phase = 0;
    f->base_color = random_hue();

    for (int i = 0; i < PARTICLES_PER_FW; i++) {
        f->parts[i].life  = 0;
        f->parts[i].decay = 0;
    }
}

static void explode(Firework *f)
{
    f->phase = 1;
    uint8_t br, bg, bb;
    ps_unpack_rgb(f->base_color, &br, &bg, &bb);

    for (int i = 0; i < PARTICLES_PER_FW; i++) {
        Particle *p = &f->parts[i];
        p->x = f->x;
        p->y = f->y;

        /* Spherical burst with slight vertical bias */
        float angle = ((float)rand() / RAND_MAX) * 2.0f * (float)M_PI;
        float speed = 0.3f + ((float)rand() / RAND_MAX) * 1.2f;
        p->vx = cosf(angle) * speed;
        p->vy = sinf(angle) * speed - 0.15f;   /* slight upward kick */

        p->life  = 0.7f + ((float)rand() / RAND_MAX) * 0.5f;
        p->decay = p->life / (25.0f + (float)(rand() % 20));

        /* Color variation around the base */
        int dr = (rand() % 60) - 30;
        int dg = (rand() % 60) - 30;
        int db = (rand() % 60) - 30;
        p->color = ps_rgb(clamp8(br + dr), clamp8(bg + dg), clamp8(bb + db));
    }
}

static void update_fireworks(void)
{
    /* Spawn new fireworks randomly, keep at least 3 in flight */
    if (fw_count < MAX_FIREWORKS && (rand() % 40) == 0) spawn_firework();
    if (fw_count < 3) spawn_firework();

    for (int i = 0; i < fw_count; i++) {
        Firework *f = &fw[i];

        if (f->phase == 0) {
            /* Rising rocket */
            f->y += f->vy;
            f->vy *= 0.985f;     /* decelerate */
            if (f->vy > -0.15f || f->y < 3) explode(f);
        } else if (f->phase == 1) {
            /* Active particles */
            int alive = 0;
            for (int j = 0; j < PARTICLES_PER_FW; j++) {
                Particle *p = &f->parts[j];
                if (p->life <= 0) continue;
                alive++;
                p->x  += p->vx;
                p->y  += p->vy;
                p->vy += GRAVITY;
                p->vx *= 0.99f;        /* drag */
                p->life -= p->decay;
            }
            if (alive == 0) f->phase = 2;
        }
    }

    /* Compact out dead fireworks */
    int w = 0;
    for (int i = 0; i < fw_count; i++) {
        if (fw[i].phase < 2) fw[w++] = fw[i];
    }
    fw_count = w;
}

/* Soft + shaped bloom around a bright pixel */
static void draw_glow(int cx, int cy, uint8_t r, uint8_t g, uint8_t b, float intensity)
{
    uint8_t a = (uint8_t)(intensity * 255);
    if (a == 0) return;
    ps_set_pixel(&scr, cx, cy, r, g, b, a);
    uint8_t a2 = a >> 2;
    if (a2) {
        ps_set_pixel(&scr, cx - 1, cy, r, g, b, a2);
        ps_set_pixel(&scr, cx + 1, cy, r, g, b, a2);
        ps_set_pixel(&scr, cx, cy - 1, r, g, b, a2);
        ps_set_pixel(&scr, cx, cy + 1, r, g, b, a2);
    }
}

static void render_fireworks(void)
{
    ps_fade(&scr, 6, 8);   /* trail fade */

    for (int i = 0; i < fw_count; i++) {
        Firework *f = &fw[i];

        if (f->phase == 0) {
            /* Rocket: bright head + dim tail */
            int ix = (int)(f->x + 0.5f);
            int iy = (int)(f->y + 0.5f);
            ps_set_pixel(&scr, ix, iy, 255, 255, 220, 255);
            ps_set_pixel(&scr, ix, iy + 1, 200, 200, 160, 120);
        } else if (f->phase == 1) {
            for (int j = 0; j < PARTICLES_PER_FW; j++) {
                Particle *p = &f->parts[j];
                if (p->life <= 0) continue;

                int ix = (int)(p->x + 0.5f);
                int iy = (int)(p->y + 0.5f);
                if (ix < 0 || ix >= scr.px_x || iy < 0 || iy >= scr.px_y) continue;

                uint8_t r, g, b;
                ps_unpack_rgb(p->color, &r, &g, &b);

                float intensity = p->life;
                if (intensity > 1.0f) intensity = 1.0f;

                /* Bright core when young, glow when old */
                if (intensity > 0.5f) {
                    draw_glow(ix, iy, r, g, b, intensity);
                } else {
                    ps_set_pixel(&scr, ix, iy,
                                 (uint8_t)(r * intensity),
                                 (uint8_t)(g * intensity),
                                 (uint8_t)(b * intensity), 255);
                }
            }
        }
    }
}

int main(int argc, char *argv[])
{
    (void)argc; (void)argv;
    srand((unsigned)time(NULL));

    if (!ps_init(&scr, SCREEN_PIXELS_X, SCREEN_PIXELS_Y,
                 PIXEL_SIZE, MARGIN, "Pixel Screen - Fireworks Demo"))
        return 1;

    printf("Pixel Screen Fireworks Demo\n");
    printf("  Pixel size  : %d\n", scr.pixel_size);
    printf("  Screen      : %d x %d logical pixels\n", scr.px_x, scr.px_y);
    printf("  Window      : %d x %d\n", scr.win_w, scr.win_h);
    printf("  ESC to quit\n");

    for (int i = 0; i < 3; i++) spawn_firework();

    for (;;) {
        if (ps_poll_quit()) break;
        ps_tick();

        update_fireworks();
        render_fireworks();
        ps_render(&scr);

        ps_delay_ms(1000 / FPS);
    }

    ps_destroy(&scr);
    return 0;
}
