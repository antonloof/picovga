#include "vga3.h"
void _init_hsync_sm(vga3_conf *conf);
void _init_vsync_sm(vga3_conf *conf);
void _init_pixel_sm(vga3_conf *conf);
void _init_pixel_dma(vga3_conf *conf, uint buf_size);
void _vga3_pixel_dma_handler(void);

void init_vga3(vga3_conf *conf)
{
    // we want a 75Mhz/4 pixel clock this could be solved with plls later
    set_sys_clock_khz(75000, true);
    _init_pixel_sm(conf);
    _init_vsync_sm(conf);
    _init_hsync_sm(conf);

    // fill buffers with data
    // set periods of h/v sync
    sync_conf *sc = conf->sync_conf;
    uint total_hor_px = sc->hsync_pulse_px + sc->hsync_back_px + sc->hsync_front_px + sc->hsync_visible_px;
    uint total_ver_lines = sc->vsync_back_lines + sc->vsync_front_lines + sc->vsync_pulse_lines + sc->vsync_visible_lines;

    pio_sm_put_blocking(conf->pio, conf->sm_hsync, sc->hsync_pulse_px - 3);                                   // low period
    pio_sm_put_blocking(conf->pio, conf->sm_hsync, total_hor_px - sc->hsync_pulse_px);                        // high period
    pio_sm_put_blocking(conf->pio, conf->sm_vsync, sc->vsync_pulse_lines * total_hor_px - 3);                 // low period
    pio_sm_put_blocking(conf->pio, conf->sm_vsync, (total_ver_lines - sc->vsync_pulse_lines) * total_hor_px); // high period

    // fill screen buffers
    uint ymax = sc->vsync_visible_lines / sc->divider;
    uint xmax = sc->hsync_visible_px / sc->divider;
    for (int y = 0; y < ymax; y++)
    {
        uint yindex = y * (xmax + 1);
        for (int x = 0; x < xmax; x++)
        {
            uint index = yindex + x;
            conf->buf1[index].pixel.r = 15;
            conf->buf1[index].pixel.g = 0;
            conf->buf1[index].pixel.b = 15;
            conf->buf1[index].pixel.ctrl = 0;
        }
        uint delay_index = yindex + xmax;
        conf->buf1[delay_index].delay.ctrl = 1;
        conf->buf1[delay_index].delay.delay = (total_hor_px - sc->hsync_visible_px) / sc->divider;
    }
    uint long_delay_index = ymax * (xmax + 1);
    conf->buf1[long_delay_index].delay.ctrl = 1;
    conf->buf1[long_delay_index].delay.delay = ((total_ver_lines - sc->vsync_visible_lines) * total_hor_px) / sc->divider / 2;
    conf->buf1[long_delay_index + 1].delay.ctrl = 1;
    conf->buf1[long_delay_index + 1].delay.delay = ((total_ver_lines - sc->vsync_visible_lines) * total_hor_px) / sc->divider / 2;
    memcpy(conf->buf1, conf->buf2, ymax * (xmax + 1) + 1);
    // time for dma
    _init_pixel_dma(conf, long_delay_index + 2);
    // start all 3 sm in sync
    hw_set_bits(
        &conf->pio->ctrl,
        (1 << (PIO_CTRL_SM_ENABLE_LSB + conf->sm_hsync)) |
            (1 << (PIO_CTRL_SM_ENABLE_LSB + conf->sm_vsync)) |
            (1 << (PIO_CTRL_SM_ENABLE_LSB + conf->sm_pixel)));
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
    }
    pio_sm_set_consecutive_pindirs(conf->pio, conf->sm_pixel, conf->pixel_pin_start, pin_count, true);
    // other sm setting
    sm_config_set_out_shift(&conf->conf_pixel, false, true, 32);
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

void _init_pixel_dma(vga3_conf *conf, uint buf_size)
{
    conf->dma_c = dma_claim_unused_channel(true);
    dma_channel_config c = dma_channel_get_default_config(conf->dma_c);

    channel_config_set_read_increment(&c, true);
    channel_config_set_write_increment(&c, false);
    channel_config_set_transfer_data_size(&c, DMA_SIZE_32);
    channel_config_set_dreq(&c, DREQ_PIO0_TX0 + conf->sm_pixel);
    dma_channel_set_irq0_enabled(DMA_IRQ_0, true);
    irq_set_enabled(DMA_IRQ_0, true);
    irq_add_shared_handler(DMA_IRQ_0, _vga3_pixel_dma_handler, PICO_SHARED_IRQ_HANDLER_DEFAULT_ORDER_PRIORITY);
    dma_channel_configure(conf->dma_c, &c, conf->pio->txf[conf->sm_pixel], NULL, buf_size, false);
}

void _vga3_pixel_dma_handler(void)
{
    dma_hw->ints0 = 1 << dma_c;
}