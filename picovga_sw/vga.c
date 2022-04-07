#include "vga.h"

void vga_dma_irq_handler(void);

void vga_init(vga_pixel *buf1, vga_pixel *buf2, vga_meta *meta)
{
    // init pll
    pll_init(pll_sys, 1, meta->pll_vcof, meta->pll_pd1, meta->pll_pd2);

    // fill up buffers
    meta->row_size = meta->h + meta->row_sync + meta->row_front + meta->row_back;
    // use 2 items for each delay per line
    meta->line_size = meta->w + 2 * meta->line_back + 2 * meta->line_front + 2 * meta->line_sync;
    uint screen_buf_size = meta->row_size * meta->line_size;
    for (uint y = 0; y < meta->h; y++)
    {
        for (uint x = 0; x < meta->w; x++)
        {
            buf1[x + y * meta->line_size].pixel.r = 0;
            buf1[x + y * meta->line_size].pixel.g = 0;
            buf1[x + y * meta->line_size].pixel.b = 0;
            buf1[x + y * meta->line_size].pixel.ctrl = 0;
            buf1[x + y * meta->line_size].pixel.rgb_oe = 0;
            buf1[x + y * meta->line_size].pixel.hsync = 1;
            buf1[x + y * meta->line_size].pixel.vsync = 1;
        }
    }

    memcpy(buf2, buf1, screen_buf_size);

    // init pio
    uint pin_base = 0;
    uint pin_count = 15;
    PIO pio = pio0;
    uint offset = pio_add_program(pio, &vga_program);
    uint sm = pio_claim_unused_sm(pio, true);
    pio_sm_config pio_c = vga_program_get_default_config(offset);
    sm_config_set_out_pins(&pio_c, pin_base, pin_count);
    sm_config_set_fifo_join(&pio_c, PIO_FIFO_JOIN_TX); // could be wrong
    sm_config_set_clkdiv(&pio_c, meta->pio_div);
    sm_config_set_out_shift(&pio_c, false, true, 32);
    for (uint i = pin_base; i < pin_base + pin_count; i++)
    {
        pio_gpio_init(pio, i);
    }
    pio_sm_set_consecutive_pindirs(pio, sm, pin_base, pin_count, true);

    // init dma
    uint dma_c = dma_claim_unused_channel(true);
    dma_channel_config dma_conf = dma_channel_get_default_config(dma_c);
    channel_config_set_read_increment(&dma_conf, true);
    channel_config_set_write_increment(&dma_conf, false);
    channel_config_set_transfer_data_size(&dma_conf, DMA_SIZE_32);
    channel_config_set_dreq(&dma_conf, DREQ_PIO0_TX0 + sm);
    dma_channel_set_irq0_enabled(dma_c, true);
    irq_set_enabled(DMA_IRQ_0, true);
    irq_set_exclusive_handler(DMA_IRQ_0, vga_dma_irq_handler);
    dma_channel_configure(dma_c, &dma_conf, &pio0_hw->txf[sm], NULL, screen_buf_size, false);

    // initialize and enable pio sm
    pio_sm_init(pio, sm, offset, &pio_c);
    pio_sm_set_enabled(pio, sm, true);
}

void vga_dma_irq_handler(void)
{
}