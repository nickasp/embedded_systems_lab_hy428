#include "tc.h"
#include "nvic.h"

/*
 * This is a custom function that accepts a ptr to a time counter
 * instance and returns its id (if instance is valid). If instance 
 * is invalid, it returns 0.
 * */
static inline uint32_t tc_periph_id(Tc *tc, uint8_t chan)
{
    if(tc == TC0 && chan == 0) return ID_TC0;
    if(tc == TC0 && chan == 1) return ID_TC1;
    if(tc == TC0 && chan == 2) return ID_TC2;
    if(tc == TC1 && chan == 0) return ID_TC3;
    if(tc == TC1 && chan == 1) return ID_TC4;
    if(tc == TC1 && chan == 2) return ID_TC5;
    if(tc == TC2 && chan == 0) return ID_TC6;
    if(tc == TC2 && chan == 1) return ID_TC7;
    if(tc == TC2 && chan == 2) return ID_TC8;

    return 0; // invalid
}

/*
 * This function initialises time counter 'tc' (TC0/TC1/TC2) with 
 * channel 'chan' (channel 0,1 or 2 of time counter 'tc') (CLOCK1 = MCK/2 = 42 MHz),
 * disables all interrupts and sets RC (register c) to rc value.  
 */
void tc_init(Tc *tc, uint8_t chan, uint32_t rc)
{
	uint32_t id;

	//checks for invalid parameters 
	if(!tc || chan > 2u) return;	

	//
	//(1) enables peripheral clock in PMC (required) 
        //
	id = tc_periph_id(tc, chan);
    	//checks if invalid id
	if(id == 0) return;
	//enables peripheral with ID 'id' value (R0 is responsible for 0-31 )
       	PMC->PMC_PCER0 = (1u << id);
	
	//
	//(2) disables 'chan' channel clock for further configuration
	//
	tc->TC_CHANNEL[chan].TC_CCR = TC_CCR_CLKDIS;
	
	//
	//(3) disables all interrupts for this channel (writes 11111111 to interrupt-disable register)
	//
	tc->TC_CHANNEL[chan].TC_IDR = 0xFF;

	//
	//(4) configures clock (MCK/2, waveform-mode, CV==RC)
	//
	tc->TC_CHANNEL[chan].TC_CMR = 
		TC_CMR_TCCLKS_TIMER_CLOCK1 |
	        TC_CMR_WAVE |
		TC_CMR_WAVSEL_UP_RC;

	//
	//(5) sets RC to rc value
	//
	tc->TC_CHANNEL[chan].TC_RC = rc;

	//
	//(6) clears status register (by reading out its current value)
	//
	(void)tc->TC_CHANNEL[chan].TC_SR;
}


void tc_pwm_init(Tc *tc, uint8_t c, uint32_t T, uint8_t D)
{
	uint32_t id;

	//checks for invalid parameters 
	if(!tc || c > 2u || D == 0 || D > 100) return;	

	//
	//(1) enables peripheral clock in PMC (required) 
        //
	id = tc_periph_id(tc, c);
    	//checks if invalid id
	if(id == 0) return;
	//enables peripheral with ID 'id' value (R0 is responsible for 0-31 )
       	PMC->PMC_PCER0 = (1u << id);
	
	//
	//(2) disables 'chan' channel clock for further configuration
	//
	tc->TC_CHANNEL[c].TC_CCR = TC_CCR_CLKDIS;
	
	//
	//(3) disables all interrupts for this channel (writes 11111111 to interrupt-disable register)
	//
	tc->TC_CHANNEL[c].TC_IDR = 0xFF;

	//special configuration for directing output to D5 pin (speaker)
	/*if(id == ID_TC6)
	{
		//provides power to PIOC
		PMC->PMC_PCER0 = (1u << ID_PIOC);
		//removes pin 25 from GPIO control
		PIOC->PIO_PDR = (1u << 25);
		//sets pin 25 under peripheral B's control (because TIOA6 reaches PC25 pin through peripheral B)
		PIOC->PIO_ABSR = (1u << 25);
		//disables interrupts on this pin as it is not to be used for input
		PIOC->PIO_IDR = (1u << 25);
	}*/

	//
	//(4) configures (TC, channel) peripheral's control mode 
	//    (MCK/2, waveform-mode, CV==RA --> set (high), CV==RC --> clear (low))
	//
	tc->TC_CHANNEL[c].TC_CMR = 
		TC_CMR_TCCLKS_TIMER_CLOCK1 |
	        TC_CMR_WAVE |
		TC_CMR_WAVSEL_UP_RC |
		TC_CMR_ACPA_SET |
		TC_CMR_ACPC_CLEAR;

	//
	//(5) sets RC to T value and RA to D value
	//
	tc->TC_CHANNEL[c].TC_RC = T;
	tc->TC_CHANNEL[c].TC_RA = D;

	//
	//(6) clears status register (by reading out its current value)
	//
	(void)tc->TC_CHANNEL[c].TC_SR;
}

/**
 * This function is responsible for enabling the (timer counter 'tc', channel 'channel') clock and reseting 
 * its counter value.
 */
void tc_enable(Tc *tc, uint8_t channel)
{
	//checks for invalid parameters 
	if(!tc || channel > 2u) return;
	//clears status register by reading out its current value
	(void)tc->TC_CHANNEL[channel].TC_SR;            
    	//resets CV and starts/enables clock for this channel
	tc->TC_CHANNEL[channel].TC_CCR = TC_CCR_CLKEN | TC_CCR_SWTRG;
}

/*
 * This function is responsible for disabling (timer counter, channel) clock.
 * */
void tc_disable(Tc *tc, uint8_t channel)
{
	//checks for invalid parameters
    	if(!tc || channel > 2u) return;
	//disables clock for this channel
    	tc->TC_CHANNEL[channel].TC_CCR = TC_CCR_CLKDIS;
}


void tc_spinus(Tc *tc, uint8_t channel, uint32_t us)
{
	//tc_init() uses TIMER_CLOCK1 => MCK/2
	const uint32_t div = 2u;
	uint64_t ticks;

	//checks for invalid parameters	
    	if(!tc || channel > 2u || us == 0u) return;

    	//formula is: [SystemCoreClock(MCK) / div(2u)] * us
    	ticks = ((uint64_t)SystemCoreClock / (uint64_t)div) * us; 
    	if(ticks == 0u) ticks = 1u;
    	if(ticks > 0xFFFFFFFFu) ticks = 0xFFFFFFFFu;

    	//sets RC to ticks value 
    	tc->TC_CHANNEL[channel].TC_RC = (uint32_t)ticks;
    	//clears status register by reading out its current value
    	(void)tc->TC_CHANNEL[channel].TC_SR;
    	//enables clock and resets CV
    	tc->TC_CHANNEL[channel].TC_CCR = TC_CCR_CLKEN | TC_CCR_SWTRG;  // start one delay period

    	while ((tc->TC_CHANNEL[channel].TC_SR & TC_SR_CPCS) == 0u) 
    	{
        	// busy wait for us seconds
    	}
	
	//disables clock for this channel
    	tc->TC_CHANNEL[channel].TC_CCR = TC_CCR_CLKDIS;
}

void tc_spinuns(Tc *tc, uint8_t channel, uint32_t uns)
{
	//tc_init() uses TIMER_CLOCK1 => MCK/2
	const uint32_t div = 2u;
	uint64_t ticks;

	//checks for invalid parameters	
    	if(!tc || channel > 2u || uns == 0u) return;

    	//formula is: ([SystemCoreClock(MCK) / div(2u)] * us) / (10^9)
    	ticks = (((uint64_t)SystemCoreClock / (uint64_t)div) * uns) / 1000000000; 
    	if(ticks == 0u) ticks = 1u;
    	if(ticks > 0xFFFFFFFFu) ticks = 0xFFFFFFFFu;

    	//sets RC to ticks value 
    	tc->TC_CHANNEL[channel].TC_RC = (uint32_t)ticks;
    	//clears status register by reading out its current value
    	(void)tc->TC_CHANNEL[channel].TC_SR;
    	//enables clock and resets CV
    	tc->TC_CHANNEL[channel].TC_CCR = TC_CCR_CLKEN | TC_CCR_SWTRG;  // start one delay period

    	while ((tc->TC_CHANNEL[channel].TC_SR & TC_SR_CPCS) == 0u) 
    	{
        	// busy wait for us seconds
    	}
	
	//disables clock for this channel
    	tc->TC_CHANNEL[channel].TC_CCR = TC_CCR_CLKDIS;
}	

/*
 * This function is responsible for returning the interrupt-request number for 
 * the (timer counter 'tc', channel 'channel') peripheral.
 *
 * */
static inline IRQn_Type tc_channel_irq(Tc *tc, uint8_t channel)
{
	uint8_t counter, base;

	//finds which counter 'tc' refers to
	if(tc == TC0) counter = 0;
	else if(tc == TC1) counter = 1;
	else counter = 2;
	//finds corresponding base
	switch(counter)
	{
		case 0:
			base = 0;
			break;
		case 1:
			base = 3;
			break;
		default:
			base = 6;
	}
	
	//returns appropriate interrupt number
	switch(base + channel)
	{
		case 0: return TC0_IRQn;
		case 1: return TC1_IRQn;
		case 2: return TC2_IRQn;
		case 3: return TC3_IRQn;
		case 4: return TC4_IRQn;
		case 5: return TC5_IRQn;
		case 6: return TC6_IRQn;
		case 7: return TC7_IRQn;
		default: return TC8_IRQn;
	}
}

void tc_int_enable(Tc *tc, uint8_t ch, uint32_t t)
{
	IRQn_Type irq;
	uint64_t ticks, div;

	//checks for invalid parameters	
    	if(!tc || ch > 2u || t == 0u) return;

	//formula is: [SystemCoreClock(MCK) / div(2u)] * t
	div = 2ul;
    	ticks = ((uint64_t)SystemCoreClock / div) * t; 
    	if(ticks == 0u) ticks = 1u;
    	if(ticks > 0xFFFFFFFFu) ticks = 0xFFFFFFFFu;

    	//sets RC to ticks value 
    	tc->TC_CHANNEL[ch].TC_RC = (uint32_t)ticks;
	
	//enables RC-compare interrupt source (CPCS)
	tc->TC_CHANNEL[ch].TC_IER = TC_IER_CPCS;
	
	//enables (timer counter 'tc', channel 'ch') peripheral's interrupts
	irq = tc_channel_irq(tc, ch);
	nvic_enable(irq);

	//clears status register by reading out its current value
    	(void)tc->TC_CHANNEL[ch].TC_SR;
    	//enables clock and resets CV
    	tc->TC_CHANNEL[ch].TC_CCR = TC_CCR_CLKEN | TC_CCR_SWTRG;  // start one delay period
}

void tc_int_disable(Tc *tc, uint8_t ch, uint32_t rc)
{
	IRQn_Type irq;
	
	//checks for invalid parameters	
    	if(!tc || ch > 2u) return;

	//disables RC-compare interrupt source (CPCS)
	tc->TC_CHANNEL[ch].TC_IDR = TC_IDR_CPCS;
	//disables (timer counter 'tc', channel 'ch') peripheral's interrupts
	irq = tc_channel_irq(tc, ch);
	nvic_disable(irq);
	//sets RC to rc value
	tc->TC_CHANNEL[ch].TC_RC = rc;
	//clears status register by reading out its current value
    	(void)tc->TC_CHANNEL[ch].TC_SR;
    	//enables clock and resets CV
    	tc->TC_CHANNEL[ch].TC_CCR = TC_CCR_CLKEN | TC_CCR_SWTRG;  // start one delay period
}

/*
 * This function is responsible for acknowledging an interrupt by reading
 * (timer counter tc, channel ch)'s status register.
 *
 * */
void tc_int_ack(Tc *tc, uint8_t ch)
{
	//checks for invalid parameters
	if(!tc || ch > 2u) return;
	
	//clears status register by reading out its current value ('acknowledges' interrupt this way)
	(void)tc->TC_CHANNEL[ch].TC_SR;	
}
