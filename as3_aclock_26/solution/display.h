#ifndef DISPLAY_H
#define DISPLAY_H

#include <stdio.h>
#include "system/sam3x8e.h"
#include "system/core_cm3.h"
#include "spi.h"
#include "font.h"

#define WIDTH 132
#define HEIGHT 64
#define PAGES 8

void display_init(void);									//initialize the diplay; A sketch of this function is provided
void display_update(void);						   			// send the full frame buffer to the display

void display_clear(void);									//set all pixels to 0 in the frame buffer
void display_char(uint8_t i, uint8_t j, char c);   			//write a char at page i, column j in the frame buffer
void display_str(uint8_t i, uint8_t j, char *str); 			//write a string at page i, column j in the frame buffer
void display_num(uint8_t i, uint8_t j, uint32_t num, uint8_t width);
															//write num as width digits at page i, column j in the frame buffer
void display_setpixel(uint8_t i, uint8_t j, uint8_t value);	// set pixel i,j to value=0,1 in the frame buffer

#endif

