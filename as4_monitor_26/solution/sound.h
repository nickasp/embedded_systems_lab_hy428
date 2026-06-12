#ifndef SOUND_H
#define SOUND_H

#include <stdio.h>
#include "system/sam3x8e.h"
#include "sound.h"
#include "tc.h"

void sound_init(void);
void sound_start(uint16_t f, uint8_t v);		// start generating a sound with freq f in [20,20000] Hz and volume v in [0,100]
void sound_stop(void);					 		// stop generating a sound
void sound(uint16_t f, uint8_t d, uint32_t ms);	// generate a sound for ms miliseconds and then return

#endif
