#include "delay.h"

void delay_1_microsecond()
{
	unsigned int count = 5;
	while(count--);
}

void delay_microseconds(unsigned int us)
{
	while(us--)
		delay_1_microsecond();
}

