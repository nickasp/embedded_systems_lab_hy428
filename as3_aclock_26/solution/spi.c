#include "spi.h"
#include "tc.h"
#include "led.h"

// init PIO pins
void spi_init(void)
{
	// enables clock for PIOA, PIOB, PIOC and PIOD
	PMC->PMC_PCER0 = (1u << ID_PIOA) |
		         (1u << ID_PIOB) |
	                 (1u << ID_PIOC) |	
	                 (1u << ID_PIOD);	


	// enables PIOA to control pin 28 (spi slave select)
	PIOA->PIO_PER = (1u << 28); 
	
	// enables PIOB to control pin 27 (spi master clock)
	PIOB->PIO_PER = (1u << 27);
	// enables PIOC to control pins 21 (spi cd), 22 (spi rst) and 23 (lcd backlight control)
	PIOC->PIO_PER = (1u << 21) |
                        (1u << 22) |
	                (1u << 23);
	// enables PIOD to control pin 7 (spi mosi)
	PIOD->PIO_PER = (1u << 7);

	
	// configures pin for PIOA as output pin
	PIOA->PIO_OER = (1u << 28);
	                //|(1u << 16);
	// configures pin for PIOB as output pins
	PIOB->PIO_OER = (1u << 27);
	// configures pins for PIOC as output pins
	PIOC->PIO_OER = (1u << 21) |
	                (1u << 22) |
                        (1u << 23);
	// configures pin for PIOD as output pins
	PIOD->PIO_OER = (1u << 7);


	// CS inactive
	PIOA->PIO_SODR = (1u << 28);
	// joystick set to '0'
	//PIOA->PIO_CODR = (1u << 16);
	// SCLK disabled
	PIOB->PIO_CODR = (1u << 27);
	// cd = 0 (command mode)
	PIOC->PIO_CODR = (1u << 21);
	// rst = 1 (RESET high after reset phase)
	PIOC->PIO_SODR = (1u << 22);
	// backlight control disabled
	PIOC->PIO_CODR = (1u << 23);
	// mosi set to '0'
	PIOD->PIO_CODR = (1u << 7);

	// initialises timer counter 0
	tc_init(TC0, 1, 100);
}

// enable/disable display
void spi_setcs(uint32_t cs)
{
	// if (cs == 1) display is disabled
	if(cs) PIOA->PIO_SODR = (1u << 28);
	// else display is enabled
	else   PIOA->PIO_CODR = (1u << 28);
}

// if byte is 0, then bit is 0. Otherwise, bit = 1.
// set the clock duration for low, high properly so that SPI speed matches display
void spi_writebit(uint8_t byte)
{
	//
	// generates a clock pulse
	//
	// disables clock (low)
	PIOB->PIO_CODR = (1u << 27);
	// sets (on mosi) value that is to be written
	if(byte) PIOD->PIO_SODR = (1u << 7); // mosi set to 1
	else PIOD->PIO_CODR = (1u << 7);     // mosi set to 0	
	// waits for at least 300 nanoseconds
	tc_spinuns(TC0, 1, 300);
	// enables clock (high)
	PIOB->PIO_SODR = (1u << 27);
	// waits for another ~300 nanoseconds
	tc_spinuns(TC0, 1, 300);
	// redisables clock (low)
	PIOB->PIO_CODR = (1u << 27);	
}

// write a byte, MSB first
void spi_writebyte(uint8_t data)
{
	int i;	
	// i needs to be signed (-1 on last for loop condition check and not 255 (wrap-around)) 
	uint8_t bit;

	// iterates over data bits
	for(i=7; i>=0; i--)
	{
		// starting with the MS bit
		bit = ((data >> i) & 1);
		// writes bit
		spi_writebit(bit);	
	}	
}

// write a buf array of len bytes
void spi_write(uint8_t *buf, uint32_t len)
{
	// checks for valid parameters
	if(!buf || !len) return;

	// writes len bytes starting from the one pointed to by buf pointer
	while(len--)
	{
		spi_writebyte(*buf);
		buf++;		
	}
}
