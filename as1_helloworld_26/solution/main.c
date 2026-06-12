#include <stdio.h>
#include <string.h>
#include "system/sam3x8e.h"
#include "display.h"
#include "led.h"
#include "delay.h"

int main(void)
{
	SystemInit();
  	SystemCoreClockUpdate();

	/* initialises display */
	display_init();
	display_clear();

	led_init();

  	for(;;)
  	{
		/* displays "Hello World!" on lcd display */
  		display_write(0, 0, "Hello World!");
		led_off();
		delay_microseconds(2000000);
		display_clear();
		led_on();
		delay_microseconds(2000000);	
  	}

  	return 0;
}


