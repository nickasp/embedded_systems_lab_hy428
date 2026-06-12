#ifndef TIME_H
#define TIME_H

#include <stdio.h>
#include "system/sam3x8e.h"

extern uint8_t HH,MM,SS;
void dclock_display(uint8_t X, uint8_t Y, uint8_t hh, uint8_t mm, uint8_t ss);

#endif
