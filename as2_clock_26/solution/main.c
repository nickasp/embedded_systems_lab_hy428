#include <stdio.h>
#include <string.h>
#include "system/sam3x8e.h"
#include "display.h"
#include "led.h"
#include "nvic.h"
#include "tc.h"
#include "sound.h"
#include "dclock.h"

volatile uint8_t do_update = 0;

void TC1_Handler(void)
{
    tc_int_ack(TC0, 1);
    do_update = 1;
}

int main(void)
{
    SystemInit();
    SystemCoreClockUpdate();
    display_init();
    display_clear();

    tc_init(TC0, 1, 100);                 // whatever your init needs
    //tc_int_enable(TC0, 1, 10);            // 10 seconds
    led_init();
    
   
	led_on();
    	tc_spinus(TC0, 1, 5);
    led_off();
    tc_spinus(TC0, 1, 5);	
    while(1) {}

    return 0;
}


