#include "system/sam3x8e.h"
#include "i2c.h"
#include "bmx160.h"
#include "tc.h"
#include "display.h"
#include "led.h"
#include "gyro.h"

static int clampi(int value, int lo, int hi)
{
    if (value < lo) return lo;
    if (value > hi) return hi;
    return value;
}

static uint16_t abs16(int16_t value)
{
    return (value < 0) ? (uint16_t)(-value) : (uint16_t)value;
}

static void draw_crosshair(void)
{
    uint8_t center_row = HEIGHT / 2;
    uint8_t center_col = WIDTH / 2;
    uint8_t row;
    uint8_t col;

    for (row = 0; row < HEIGHT; row++) {
        display_setpixel(row, center_col, 1);
    }

    for (col = 0; col < WIDTH; col++) {
        display_setpixel(center_row, col, 1);
    }
}

static void draw_dot(int row, int col)
{
    int dr;
    int dc;

    for (dr = -2; dr <= 2; dr++) {
        for (dc = -2; dc <= 2; dc++) {
            int r = row + dr;
            int c = col + dc;

            if (r >= 0 && r < HEIGHT && c >= 0 && c < WIDTH) {
                display_setpixel((uint8_t)r, (uint8_t)c, 1);
            }
        }
    }
}

static void draw_screen(void)
{
    int16_t xraw = (int16_t)gyro.xraw;
    int16_t yraw = (int16_t)gyro.yraw;
    int16_t zraw = (int16_t)gyro.zraw;

    int dot_col;
    int dot_row;

    display_clear();
    draw_crosshair();

    dot_col = (WIDTH / 2) + (xraw >> 7);
    dot_row = (HEIGHT / 2) - (yraw >> 7);

    dot_col = clampi(dot_col, 2, WIDTH - 3);
    dot_row = clampi(dot_row, 2, HEIGHT - 3);

    draw_dot(dot_row, dot_col);

    display_str(0, 0, "X");
    display_str(0, 6, (xraw < 0) ? "-" : " ");
    display_num(0, 12, abs16(xraw), 5);

    display_str(1, 0, "Y");
    display_str(1, 6, (yraw < 0) ? "-" : " ");
    display_num(1, 12, abs16(yraw), 5);

    display_str(2, 0, "Z");
    display_str(2, 6, (zraw < 0) ? "-" : " ");
    display_num(2, 12, abs16(zraw), 5);

    display_update();
}

void gpio_init(){
    //enable PIO B on PMC
    PMC->PMC_PCER0 |= (1U<<12);
    //enable PIO B peripheral
    PIOB->PIO_PER |= PIO_PB27;
    //enable output
    PIOB->PIO_OER |= PIO_PB27 ;
    //set PB27 low
    PIOB->PIO_CODR |= PIO_PB27 ;
}

int main(void)
{
    SystemInit();
    SystemCoreClockUpdate();
    gpio_init();
    i2c_init();
    led_init();
    display_init();
    display_clear();
    display_update();

    tc_init(TC0, 1, 0);
    gyro_init();
    led_on();

    while (1) {
        gyro_read();
        draw_screen();
        tc_spinuns(TC0, 1, 100000000);
        led_on();
    }
}
