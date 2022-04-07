#include "vga3.h"
void _init_hsync_sm(vga3_conf *conf);
void _init_vsync_sm(vga3_conf *conf);
void _init_pixel_sm(vga3_conf *conf);

void init_vga3(vga3_conf *conf)
{
    // we want a 75Mhz/4 pixel clock this could be solved with plls later
    set_sys_clock_khz(75000, true);
    _init_pixel_sm(conf);
    _init_hsync_sm(conf);
    _init_vsync_sm(conf);
    // fill buffers with data
}

void _init_pixel_sm(vga3_conf *conf)
{
    conf->offset_pixel = pio_add_program(conf->pio, &vga3_pixel_program);
    conf->sm_pixel = pio_claim_unused_sm(conf->pio, true);
    conf->conf_pixel = vga3_pixel_program_get_default_config(conf->offset_pixel);
    // pins as output
    int pin_count = 12;
    sm_config_set_out_pins(&conf->conf_pixel, conf->pixel_pin_start, pin_count);
    for (uint i = pixel_pin_start; i < conf->pixel_pin_start + pin_count; i++)
    {
        pio_gpio_init(pio, i);
    }
    pio_sm_set_consecutive_pindirs(pio, sm, conf->pixel_pin_start, pin_count, true);
    // other sm setting
    sm_config_set_out_shift(&conf->conf_pixel, false, true, 32);
    // we good bois!!!
    pio_sm_init(conf->pio, conf->sm_pixel, conf->offset_pixel, &conf->conf_pixel);
    // enable is done with all 3 sm in sync
}

void _init_vsync_sm(vga3_conf *conf)
{
}

void _init_hsync_sm(vga3_conf *conf)
{
}