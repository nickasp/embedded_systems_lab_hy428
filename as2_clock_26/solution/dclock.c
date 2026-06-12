#include "dclock.h"
#include "display.h"

uint8_t HH,MM,SS;

void dclock_display(uint8_t X, uint8_t Y, uint8_t hh, uint8_t mm, uint8_t ss)
{
	char pbuffer[10];
	
	/* manually build the string of 'HH:MM:SS' format */
	/* HH: */
	pbuffer[0] = '0' + hh/10;
	pbuffer[1] = '0' + hh%10;
	pbuffer[2] = ':';
	/* MM: */
	pbuffer[3] = '0' + mm/10;
	pbuffer[4] = '0' + mm%10;
	pbuffer[5] = ':';
	/* SS: */
	pbuffer[6] = '0' + ss/10;
	pbuffer[7] = '0' + ss%10;

	pbuffer[8] = '\0';
		
	/* time is printed out onto the LCD display */
	display_str(X, Y, pbuffer);
}
