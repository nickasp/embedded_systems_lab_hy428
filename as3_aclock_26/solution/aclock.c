#include <stdint.h>
#include "aclock.h"
#include "math.h"
#include "display.h"
#include "led.h"
#include "tc.h"

#define PI 3.14

//draw the frame at cx,cy with radius r
void aclock_frame(uint8_t cx, uint8_t cy, uint8_t r)
{
	double x, y;

	for(int angle=0; angle<360; angle++)
	{
		x = round(cx + r * cos((double)angle * (PI/180.0)));
		y = round(cy + r * sin((double)angle * (PI/180.0)));
		display_setpixel(x, y, 1u);
	}	
}

//draw a hand with origin cx,cy, length r, and tick t in [0,59]
void aclock_hand(uint8_t cx, uint8_t cy, uint8_t r, uint16_t t)
{
	double x, y, angle_in_radians;

	angle_in_radians = -(((2*PI)/60) * t);
	for(int i=0; i<=r; i++)
	{
		x = round(cx + i * cos(angle_in_radians));
		y = round(cy + i * sin(angle_in_radians));
		display_setpixel(x, y, 1u);	
	}
}

//draw a symbol, e.g. a fat dot, on the frame (x,y,r) at angle a
void aclock_framesymbol(uint8_t cx, uint8_t cy, uint8_t r, uint16_t d)
{
	double x, y, angle;
        
       	angle = (d * (PI/180.0)) -PI/2;
	x = round(cx + (r * cos(angle)));	
	y = round(cy + (r * sin(angle)));
	display_setpixel(x, y, 1u);
}

//draw the full thing at x,r with radius r for hh:mm:ss
void aclock_display(uint8_t x, uint8_t y, uint8_t r, uint8_t hh, uint8_t mm, uint8_t ss)
{
	// checks for invalid time parameters
	if(hh > 23 || mm > 59 || ss > 59) return;

	// draws the clock circle centered
	// in the middle of the display
	aclock_frame(32, 67, 30);

	// draws the dots 
	for(uint16_t i=0; i<12; i++)
		aclock_framesymbol(32, 67, 25, i*30);
	
	// draws hour-hand (initial position)
	switch(hh)
	{
		case 0:
		case 12:
			aclock_hand(32, 67, 10, 0);
			break;
		case 1:
		case 13:
			aclock_hand(32, 67, 10, 5);
			break;
		case 2:
		case 14:
			aclock_hand(32, 67, 10, 10);
			break;
		case 3:
		case 15:
			aclock_hand(32, 67, 10, 15);
			break;	
		case 4:
		case 16:
			aclock_hand(32, 67, 10, 20);
			break;
		case 5:
		case 17:
			aclock_hand(32, 67, 10, 25);
			break;
		case 6:
		case 18:
			aclock_hand(32, 67, 10, 30);
			break;
		case 7:
		case 19:
			aclock_hand(32, 67, 10, 35);
			break;
		case 8:
		case 20:
			aclock_hand(32, 67, 10, 40);
			break;
		case 9:
		case 21:
			aclock_hand(32, 67, 10, 45);
			break;
		case 10:
		case 22:
			aclock_hand(32, 67, 10, 50);
			break;
		default:
			aclock_hand(32, 67, 10, 55);
	}

	// draws minute-hand (initial position)
	aclock_hand(32, 67, 19, mm);

	// draws second-hand (initial position)
	aclock_hand(32, 67, 19, ss);

	display_update();
}




