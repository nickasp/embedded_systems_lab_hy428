#ifndef INTERRUPT_H
#define INTERRUPT_H

#include <stdio.h>
#include "system/sam3x8e.h"

void nvic_enable(IRQn_Type irq);                          // enable interrupt irq
void nvic_disable(IRQn_Type irq);                         // disable interrupt irq
void nvic_setpriority (IRQn_Type irq, uint32_t priority); // set priority of irq to priority

#endif // INTERRUPT_H
