#ifndef INTERRUPT_H
#define INTERRUPT_H

#include <stdio.h>
#include "system/sam3x8e.h"

void interruptEnable(IRQn_Type IRQn);

void interruptDisable(IRQn_Type IRQn);

void interruptSetPriority(IRQn_Type IRQn, uint32_t priority);


#endif
