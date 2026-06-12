#ifndef DISPLAY_H
#define DISPLAY_H

#include <stdio.h>
#include "system/sam3x8e.h"

#define WIDTH 128
#define HEIGHT 64


#define FONTX 6
#define FONTY 8

void display_init();

void display_clear();

void display_write(uint8_t X, uint8_t Y, char *str);

void display_write_num(uint8_t X, uint8_t Y, uint32_t num);

#endif
