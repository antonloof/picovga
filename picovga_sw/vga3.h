#pragma once

#include <string.h>

#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/pll.h"
#include "hardware/clocks.h"
#include "vga3.pio.h"
#include "hardware/dma.h"
#include "hardware/irq.h"
#include "hardware/gpio.h"

typedef union __attribute__((packed)) vga3_pixel
{
    struct __attribute__((packed))
    {
        uint ctrl : 1;
        uint b : 4;
        uint r : 4;
        uint g : 4;
        uint pad : 3;
    } pixel;
    struct __attribute__((packed))
    {
        uint ctrl : 1;
        uint delay : 15;
    } delay;
} vga3_pixel;

typedef struct sync_conf
{
    uint hsync_visible_px, hsync_front_px, hsync_pulse_px, hsync_back_px;
    uint vsync_visible_lines, vsync_front_lines, vsync_pulse_lines, vsync_back_lines;
    uint divider, buf_size, total_hor_px, total_ver_lines;
    uint next_line, next_line_div;
    uint one_line_buffer_size;
} sync_conf;

typedef struct vga3_conf
{
    // set by user
    int pixel_pin_start;
    int vsync_pin, hsync_pin;
    PIO pio;
    sync_conf *sync_conf;
    vga3_pixel *reading, *writing;
    // set by system
    uint sm_pixel, sm_hsync, sm_vsync;
    uint offset_pixel, offset_hsync, offset_vsync;
    pio_sm_config conf_pixel, conf_hsync, conf_vsync;
    uint dma_c, should_swap_buffers;
    vga3_pixel *reading_offset;
    uint long_delay, short_delay;
} vga3_conf;

void init_vga3(vga3_conf *conf);
void set_rgb_vga3(vga3_conf *conf, uint r, uint g, uint b);