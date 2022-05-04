#include "vga3.h"
void _init_hsync_sm(vga3_conf *conf);
void _init_vsync_sm(vga3_conf *conf);
void _init_pixel_sm(vga3_conf *conf);
void _init_pixel_dma(vga3_conf *conf);
void _vga3_pixel_dma_handler(void);
void _init_sync_config(sync_conf *sc);
void _split_delay(vga3_pixel *px1, uint delay);

// ugly hack to get classes working, needs proper asociation with irq
vga3_conf *global_conf;

void init_vga3(vga3_conf *conf)
{
    gpio_init(20);
    gpio_set_dir(20, true);
    gpio_put(20, 0);
    global_conf = conf; // ungly hack for interrupt routine
    _init_sync_config(conf->sync_conf);
    _init_pixel_sm(conf);
    _init_vsync_sm(conf);
    _init_hsync_sm(conf);

    // fill buffers with data
    // set periods of h/v sync
    sync_conf *sc = conf->sync_conf;

    pio_sm_put_blocking(conf->pio, conf->sm_hsync, sc->hsync_back_px);                     // hsync phase
    pio_sm_put_blocking(conf->pio, conf->sm_hsync, sc->hsync_pulse_px - 3 - 1);            // low period
    pio_sm_put_blocking(conf->pio, conf->sm_hsync, sc->total_hor_px - sc->hsync_pulse_px); // high period

    pio_sm_put_blocking(conf->pio, conf->sm_vsync, 0);                                                                // vsync phase
    pio_sm_put_blocking(conf->pio, conf->sm_vsync, sc->vsync_pulse_lines * sc->total_hor_px - 3 - 1);                 // low period
    pio_sm_put_blocking(conf->pio, conf->sm_vsync, (sc->total_ver_lines - sc->vsync_pulse_lines) * sc->total_hor_px); // high period

    // fill screen buffers
    conf->long_delay = sc->total_hor_px * (sc->vsync_back_lines + sc->vsync_front_lines + sc->vsync_pulse_lines);
    conf->short_delay = sc->hsync_back_px + sc->hsync_front_px + sc->hsync_pulse_px;
    int ypos_max = sc->vsync_visible_lines / sc->divider;
    sc->one_line_buffer_size = sc->hsync_visible_px / sc->divider + 2;
    for (int y = 0; y < 1; y++)
    {
        for (int x = 0; x < sc->one_line_buffer_size - 2; x++)
        {
            int i = y * sc->one_line_buffer_size + x;
            conf->reading[i].pixel.r = 0;
            conf->reading[i].pixel.g = 0;
            conf->reading[i].pixel.b = 15;
            conf->reading[i].pixel.ctrl = 0;
        }
        uint last_index = (y + 1) * sc->one_line_buffer_size;
        _split_delay(&conf->reading[last_index - 2], conf->short_delay);
    }
    memcpy(conf->writing, conf->reading, sc->buf_size * 2);

    // time for dma
    pio_sm_put_blocking(conf->pio, conf->sm_pixel, 0); // dummy stuffs
    _init_pixel_dma(conf);
    conf->should_swap_buffers = 0;
    conf->reading_offset = conf->reading;
    _vga3_pixel_dma_handler(); // start dma irq loop
    // start all 3 sm in sync
    hw_set_bits(
        &conf->pio->ctrl,
        (1 << (PIO_CTRL_SM_ENABLE_LSB + conf->sm_hsync)) |
            (1 << (PIO_CTRL_SM_ENABLE_LSB + conf->sm_vsync)) |
            (1 << (PIO_CTRL_SM_ENABLE_LSB + conf->sm_pixel)));
}

void _split_delay(vga3_pixel *px1, uint delay)
{
    // total delay=(6+2x+2)+(6+2y+2)=16+4x(y)
    // x=y or x=y+1

    uint full_count = (delay - 2 * 7) / 2;
    px1->delay.ctrl = 1;
    px1->delay.delay = full_count / 2;
    (px1 + 1)->delay.ctrl = 1;
    (px1 + 1)->delay.delay = full_count / 2 + (full_count & 0b1);
}

void _init_pixel_sm(vga3_conf *conf)
{
    conf->offset_pixel = pio_add_program(conf->pio, &vga3_pixel_program);
    conf->sm_pixel = pio_claim_unused_sm(conf->pio, true);
    conf->conf_pixel = vga3_pixel_program_get_default_config(conf->offset_pixel);
    // pins as output
    int pin_count = 12;
    sm_config_set_out_pins(&conf->conf_pixel, conf->pixel_pin_start, pin_count);
    for (uint i = conf->pixel_pin_start; i < conf->pixel_pin_start + pin_count; i++)
    {
        pio_gpio_init(conf->pio, i);
        gpio_set_drive_strength(i, GPIO_DRIVE_STRENGTH_12MA);
    }
    pio_sm_set_consecutive_pindirs(conf->pio, conf->sm_pixel, conf->pixel_pin_start, pin_count, true);
    // other sm setting
    sm_config_set_out_shift(&conf->conf_pixel, true, true, 32);
    sm_config_set_fifo_join(&conf->conf_pixel, PIO_FIFO_JOIN_TX);
    // we good bois!!!
    pio_sm_init(conf->pio, conf->sm_pixel, conf->offset_pixel, &conf->conf_pixel);
    // enable is done with all 3 sm in sync
}

void _init_vsync_sm(vga3_conf *conf)
{
    conf->offset_vsync = pio_add_program(conf->pio, &vga3_sync_program);
    conf->sm_vsync = pio_claim_unused_sm(conf->pio, true);
    conf->conf_vsync = vga3_sync_program_get_default_config(conf->offset_vsync);
    sm_config_set_sideset_pins(&conf->conf_vsync, conf->vsync_pin);
    pio_gpio_init(conf->pio, conf->vsync_pin);
    pio_sm_set_consecutive_pindirs(conf->pio, conf->sm_vsync, conf->vsync_pin, 1, true);
    sm_config_set_out_shift(&conf->conf_vsync, false, true, 32);
    pio_sm_init(conf->pio, conf->sm_vsync, conf->offset_vsync, &conf->conf_vsync);
}

void _init_hsync_sm(vga3_conf *conf)
{
    conf->offset_hsync = pio_add_program(conf->pio, &vga3_sync_program);
    conf->sm_hsync = pio_claim_unused_sm(conf->pio, true);
    conf->conf_hsync = vga3_sync_program_get_default_config(conf->offset_hsync);
    sm_config_set_sideset_pins(&conf->conf_hsync, conf->hsync_pin);
    pio_gpio_init(conf->pio, conf->hsync_pin);
    pio_sm_set_consecutive_pindirs(conf->pio, conf->sm_hsync, conf->hsync_pin, 1, true);
    sm_config_set_out_shift(&conf->conf_hsync, false, true, 32);
    pio_sm_init(conf->pio, conf->sm_hsync, conf->offset_hsync, &conf->conf_hsync);
}

void _init_pixel_dma(vga3_conf *conf)
{
    conf->dma_c = dma_claim_unused_channel(true);
    dma_channel_config c = dma_channel_get_default_config(conf->dma_c);

    channel_config_set_read_increment(&c, true);
    channel_config_set_write_increment(&c, false);
    channel_config_set_transfer_data_size(&c, DMA_SIZE_32);
    channel_config_set_dreq(&c, DREQ_PIO0_TX0 + conf->sm_pixel);

    dma_channel_set_irq0_enabled(conf->dma_c, true);

    irq_set_exclusive_handler(DMA_IRQ_0, _vga3_pixel_dma_handler);
    // irq_set_priority(DMA_IRQ_0, 0);
    irq_set_enabled(DMA_IRQ_0, true);

    dma_channel_configure(conf->dma_c, &c, &conf->pio->txf[conf->sm_pixel], NULL, conf->sync_conf->one_line_buffer_size / 2, false);
}

void __not_in_flash_func(_vga3_pixel_dma_handler)(void)
{
    gpio_put(20, 1);
    dma_hw->ints0 = (1u << global_conf->dma_c);
    dma_channel_set_read_addr(global_conf->dma_c, global_conf->reading, true);
    gpio_put(20, 0);
    return;
    global_conf->sync_conf->next_line_div++;
    global_conf->sync_conf->next_line++;

    if (global_conf->sync_conf->next_line_div == global_conf->sync_conf->divider)
    {
        global_conf->reading_offset += global_conf->sync_conf->one_line_buffer_size;

        global_conf->sync_conf->next_line_div = 0;
        // we should only use the long delay for the last pixel, not the last pixel of the last 4 rows
        if (global_conf->sync_conf->next_line == global_conf->sync_conf->vsync_visible_lines - global_conf->sync_conf->divider)
        {
            _split_delay(
                global_conf->reading_offset + global_conf->sync_conf->one_line_buffer_size - 2,
                global_conf->short_delay);
        }
    }

    if (global_conf->sync_conf->next_line == global_conf->sync_conf->vsync_visible_lines - 1)
    {
        _split_delay(
            global_conf->reading_offset + global_conf->sync_conf->one_line_buffer_size - 2,
            global_conf->long_delay);
    }
    if (global_conf->sync_conf->next_line == global_conf->sync_conf->vsync_visible_lines)
    {
        if (global_conf->should_swap_buffers)
        {
            vga3_pixel *tmp = global_conf->reading;
            global_conf->reading = global_conf->writing;
            global_conf->writing = tmp;
            global_conf->should_swap_buffers = 0;
        }
        global_conf->reading_offset = global_conf->reading;
        global_conf->sync_conf->next_line = 0;
        global_conf->sync_conf->next_line_div = 0;
    }
}

void _init_sync_config(sync_conf *sc)
{
    sc->total_hor_px = sc->hsync_pulse_px + sc->hsync_back_px + sc->hsync_front_px + sc->hsync_visible_px;
    sc->total_ver_lines = sc->vsync_back_lines + sc->vsync_front_lines + sc->vsync_pulse_lines + sc->vsync_visible_lines;
    sc->next_line = 0;
    sc->next_line_div = 0;
}