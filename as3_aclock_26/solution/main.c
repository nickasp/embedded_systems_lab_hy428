#include <stdio.h>
#include <string.h>
#include "system/sam3x8e.h"
#include "adc.h"
#include "display.h"
#include "led.h"
#include "tc.h"
#include "aclock.h"


typedef enum direction 
{
	UP,
	LEFT,
	RIGHT,
	PUSH,
	IDLE
}direction_t;

static inline direction_t direction_helper(uint32_t jvalue)
{
	if(jvalue == 0)
		return RIGHT;
	else if(jvalue == 4095)
		return IDLE;
	else if((jvalue > 3750) && (jvalue < 3760))
		return LEFT;
	else if((jvalue > 1225) && (jvalue < 1235))
		return PUSH;
	else
		return UP;
}

static inline char *direction_str(direction_t dir)
{
	switch(dir)
	{
		case UP:
			return "UP";
		case LEFT:
			return "LEFT";
		case RIGHT:
			return "RIGHT";
		case PUSH:
			return "PUSH";
		default: //IDLE
			return "IDLE";
	}
}

int main()
{
	uint8_t hh, mm, ss;
	uint32_t jvalue, i, ls_bit;
	direction_t dir;

	SystemInit();
  	SystemCoreClockUpdate();

	led_init();

	// initializes display
	display_init();

  	display_clear();
	display_update();

	adc_init();
	adc_enable(7);

	tc_init(TC1, 1, 0);
	tc_enable(TC1, 1);
	
	hh = 12;
	mm = 58;
	ss = 5;
	aclock_display(32, 67, 30, hh, mm, ss);

	while(1)
	{
		tc_spinus(TC1, 1, 1);
		ss++;
		if(ss >= 60)
		{
			ss = 0;
			mm++;
		}
		if(mm >= 60)
		{
			mm = 0;
			hh++;
		}
		if(hh >= 24)
		{
			hh = 0;
		}
		
		display_clear();
		aclock_display(32, 67, 30, hh, mm, ss);
	}

  	return 0;
}
