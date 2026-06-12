#include "sound.h"
#include "tc.h"

void sound_init(void)
{
	//provides power to PIOC (controlls pin 25 for TIOA6)
	PMC->PMC_PCER0 |= (1u << ID_PIOC);
	//allows PIO registers to be written using PIO_WPMR (disables write-protection)
	PIOC->PIO_WPMR = PMC_WPMR_WPKEY_PASSWD; //WPEN bit = 0
	//removes pin 25 from GPIO control
	PIOC->PIO_PDR = PIO_PC25;
	//enables pin 25 as output using PIO_OER
	PIOC->PIO_OER = PIO_PC25;
	//sets pin 25 under peripheral B's control (because TIOA6 reaches PC25 pin through peripheral B)
	PIOC->PIO_ABSR = PIO_PC25;
	//disables interrupts on this pin as it is not to be used for input
	PIOC->PIO_IDR = PIO_PC25;

	//starts with no sound
	tc_pwm_init(TC2, 0, 42000, 21000);   // default 1 kHz, 50%
	sound_stop();
}

static inline uint32_t freq_to_ticks(uint16_t freq)
{
	uint64_t ticks = (((uint64_t)SystemCoreClock / (uint64_t)2u) / (uint64_t)freq);
        if(ticks < 2u) ticks = 2u;                 //needs room for RA < RC
        if(ticks > 0xFFFFFFFFu) ticks = 0xFFFFFFFFu;
        return (uint32_t)ticks;
}

static inline void delay_ms_blocking(uint32_t ms)
{
	tc_spinus(TC0, 0, ms);	
}

void sound_start(uint16_t freq, uint8_t vol)
{
	uint32_t rc, ra;

	// checks for invalid arguments 
	//if(freq < 20 || freq > 20000 || vol > 100) return;

    	if(!vol) 
	{
        	sound_stop();
        	return;
    	}

	// converts frequency (Hz) to processor ticks
    	rc = freq_to_ticks(freq);

    	//Duty as "volume": RA = RC * v / 100, but RA must be < RC for clean behavior.
    	ra = (uint32_t)(((uint64_t)rc * (uint64_t)vol) / (uint64_t)100u);
    	if(ra >= rc) ra = rc - 1u;
    	if(ra == 0u) ra = 1u;

    	// tc_pwm_init(TC2, 0, rc, ra);
	
	//stops (TC2, 0) peripheral's clock
	TC2->TC_CHANNEL[0].TC_CCR = TC_CCR_CLKDIS;	
	
	// configures rc, ra 
	TC2->TC_CHANNEL[0].TC_RC = rc;
        TC2->TC_CHANNEL[0].TC_RA = ra;

	// clears status register
	(void)TC2->TC_CHANNEL[0].TC_SR;

	//resets CV and re-enables clock for this channel
	TC2->TC_CHANNEL[0].TC_CCR = TC_CCR_CLKEN | TC_CCR_SWTRG;
}

void sound_stop(void)
{
	//stops (TC2, 0) peripheral's clock
	TC2->TC_CHANNEL[0].TC_CCR = TC_CCR_CLKDIS;	
}

void sound(uint16_t f, uint8_t v, uint32_t ms)
{
	sound_start(f, v);
    	delay_ms_blocking(ms);
    	sound_stop();
}
