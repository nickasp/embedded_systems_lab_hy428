#ifndef _ACLOCK_H_
#define _ACLOCK_H_

#include <stdio.h>

//draw the frame at cx,cy with radius r
void aclock_frame(uint8_t cx, uint8_t cy, uint8_t r);				
//draw a hand with origin cx,cy, length r, and tick t in [0,59]
void aclock_hand(uint8_t cx, uint8_t cy, uint8_t r, uint16_t t);	
//draw a symbol, e.g. a fat dot, on the frame (x,y,r) at angle a
void aclock_framesymbol(uint8_t cx, uint8_t cy, uint8_t r, uint16_t d);
//draw the full thing at x,r with radius r for hh:mm:ss
void aclock_display(uint8_t x, uint8_t y, uint8_t r, uint8_t hh, uint8_t mm, uint8_t ss);			

#endif
