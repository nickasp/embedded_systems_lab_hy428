#include "nvic.h"

static inline uint32_t _index(IRQn_Type irq)
{
	return ((uint32_t)irq <= 29ul) ? 0ul : 1ul;
}

/*
 * This function is responsibe for enabling interrupt irq.
 * */
void nvic_enable(IRQn_Type irq)
{
	//we do not allow enabling processor exceptions' interrupts (with ids < 0)
	if(irq < 0) 
		return;	
	NVIC->ISER[_index(irq)] = (1ul << ((uint32_t)irq & 0x1F));	
}

/*
 * This function is responsible for disabling interrupt irq.
 * */
void nvic_disable(IRQn_Type irq)
{
	//we do not allow disabling processor exceptions' interrupts (with ids < 0)
	if(irq < 0)
		return;
	NVIC->ICER[_index(irq)] = (1ul << ((uint32_t)irq & 0x1F));
}

/*
 * This function is responsible for setting interrupt irq's priority
 * to prio value.
 * */
void nvic_setpriority(IRQn_Type irq, uint32_t prio)
{
	//checks for valid priority
	if(prio>15) 
		return;	
	NVIC->IP[0+(irq*8)] = (prio << 4ul);
}
