#pragma once

#include <string.h>

#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/pll.h"
#include "hardware/clocks.h"
#include "vga.pio.h"
#include "hardware/dma.h"
#include "hardware/irq.h"

/*
designed for a fixed resolution of 640/2 x 480/2 at 75Hz
http://tinyvga.com/vga-timing/640x480@75Hz
this means a pixel clock of 31.5 MHz.
we can use 3 or more cycles to output a pixel
for 3 we need the following pll config
    Requested: 94.5 MHz
    Achieved: 94.5 MHz
    FBDIV: 126 (VCO = 1512 MHz)
    PD1: 4
    PD2: 4
    pll_init(pll_sys, 1, 1512 * MHZ, 4, 4);
for 4 we need the following
    Requested: 126.0 MHz
    Achieved: 126.0 MHz
    FBDIV: 126 (VCO = 1512 MHz)
    PD1: 6
    PD2: 2
    pll_init(pll_sys, 1, 1512 * MHZ, 6, 2);
*/

typedef union vga_pixel
{
    struct __attribute__((packed))
    {
        uint ctrl : 1;
        uint rgb_oe : 1;
        uint vsync : 1;
        uint hsync : 1;
        uint b : 4;
        uint r : 4;
        uint g : 4;
    } pixel;
    struct __attribute__((packed))
    {
        uint ctrl : 1;
        uint rgb_oe : 1;
        uint vsync : 1;
        uint hsync : 1;
        uint delay : 12;
    } delay;
} vga_pixel;

typedef struct vga_meta
{
    uint w, h;
    vga_pixel *readbuf, *write_buf;
    uint line_front, line_back, line_sync, line_size;
    uint row_front, row_back, row_sync, row_size;
    uint pll_vcof, pll_pd1, pll_pd2;
    uint pio_div;
} vga_meta;

// http://tinyvga.com/vga-timing/1024x768@70Hz but 1/4 speed
// pixel clock of 18.75MHz
vga_meta VESA_1024c768_70HZ_QUARTER_XY = {
    .w = 1024 / 4,
    .h = 768 / 4,
    .readbuf = 0,
    .write_buf = 0,
    .line_front = 24 / 4,
    .line_back = 144 / 4,
    .line_sync = 136 / 4,
    .row_front = 3,
    .row_back = 29,
    .row_sync = 6,
    .pll_vcof = 900 * MHZ,
    .pll_pd1 = 4,
    .pll_pd2 = 2,
    .pio_div = 2,
};

void vga_init(vga_pixel *buf1, vga_pixel *buf2, vga_meta *meta);
void vga_set_rgb(uint x, uint y, uint r, uint g, uint b);
