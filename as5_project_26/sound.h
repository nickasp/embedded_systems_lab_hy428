#ifndef SOUND_H
#define SOUND_H

#include <stdio.h>
#include "system/sam3x8e.h"

void sound_init(void);
void sound_start(uint16_t frequency, uint8_t volume);
void sound_stop(void);
void sound(uint16_t frequency, uint8_t volume, uint32_t ms);

#endif /* SOUND_H */
