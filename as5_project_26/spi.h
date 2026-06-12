#ifndef SPI_H
#define SPI_H

#include <stdio.h>
#include "system/sam3x8e.h"

void spi_init(void);			    // init PIO pins
void spi_setcs(uint32_t cs);		    // enable/disable display
void spi_writebit(uint8_t byte);	    // if byte is 0 then bit is 0, otherwise bit=1. 
					    // set the clock duration for low, high properly so that SPI speed matches display 
void spi_writebyte(uint8_t data);	    // write a byte, MSB first
void spi_write(uint8_t *buf, uint32_t len); // write a buf array of len bytes

#endif
