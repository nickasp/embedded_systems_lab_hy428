#include "led.h"
#include "system/sam3x8e.h"

void led_init() 
{
    PMC->PMC_PCER0 |= (1U << ID_PIOB);    // Enable PIOB in PMC
    PIOB->PIO_PER = PIO_PB25;             // Enable PIO control on PB25
    PIOB->PIO_OER = PIO_PB25;             // Set PB25 as output
    led_off();                            // Start with LED off
}

void led_on() 
{
    PIOB->PIO_SODR = PIO_PB25;            // Set PB25 high (LED on)
}

void led_off() 
{
    PIOB->PIO_CODR = PIO_PB25;            // Set PB25 low (LED off)
}
