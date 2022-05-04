
#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "vga3.h"

// this must be an even number
#define BUF_SIZE (1024 / 4 * 768 / 4 + 4 * 768 / 4)

sync_conf VGA3_SYNC_VESA_1024X768_70HZ = {
    1024, 24, 136, 144,
    768, 3, 6, 29,
    4, BUF_SIZE};

vga3_pixel buf1[BUF_SIZE], buf2[BUF_SIZE];

vga3_conf vga_conf = {0, 13, 14, pio0, &VGA3_SYNC_VESA_1024X768_70HZ, buf1, buf2};

int main()
{
    // we want a 75Mhz/4 pixel clock this could be solved with plls later
    set_sys_clock_khz(75000, true);

    stdio_init_all();
    init_vga3(&vga_conf);
    while (1)
    {
    }
    return 0;
}
