#include "sound.h"
#include "tc.h"

void sound_init(void)
{
	//provides power to PIOC (controlls pin 25 for TIOA6)
	PMC->PMC_PCER0 = (1u << ID_PIOC);
	//allows PIO registers to be written using PIO_WPMR (disables write-protection)
	PIOC->PIO_WPMR = PMC_WPMR_WPKEY_PASSWD; //WPEN bit = 0
	//removes pin 25 from GPIO control
	PIOC->PIO_PDR = (1u << 25);
	//enables pin 25 as output using PIO_OER
	PIOC->PIO_OER = (1u << 25);
	//sets pin 25 under peripheral B's control (because TIOA6 reaches PC25 pin through peripheral B)
	PIOC->PIO_ABSR = (1u << 25);
	//disables interrupts on this pin as it is not to be used for input
	PIOC->PIO_IDR = (1u << 25);

	//starts with no sound
	sound_stop();
}

static inline uint32_t freq_to_rc_ticks(uint16_t f)
{
	uint64_t ticks = (((uint64_t)SystemCoreClock / (uint64_t)2u) / (uint64_t)f);
        if(ticks < 2u) ticks = 2u;                 //needs room for RA < RC
        if(ticks > 0xFFFFFFFFu) ticks = 0xFFFFFFFFu;
        return (uint32_t)ticks;
}

static inline void clamp_u16(uint16_t *f, uint16_t lo, uint16_t hi)
{
	if(*f < lo) *f = lo;
	else if(*f > hi) *f = hi;
}

static inline void clamp_u8(uint8_t *v, uint8_t lo, uint8_t hi)
{
	if(*v < lo) *v = lo;
	if(*v > hi) *v = hi;
}

static inline void delay_ms_blocking(uint32_t ms)
{
	tc_spinus(TC0, 0, (ms/1000));	
}

void sound_start(uint16_t f, uint8_t v)
{
	uint32_t rc, ra;

	clamp_u16(&f, 20u, 20000u);
    	clamp_u8(&v, 0u, 100u);

    	if(v == 0u) 
	{
        	sound_stop();
        	return;
    	}

    	rc = freq_to_rc_ticks(f);

    	//Duty as "volume": RA = RC * v / 100, but RA must be < RC for clean behavior.
    	ra = (uint32_t)(((uint64_t)rc * (uint64_t)v) / 100u);
    	if(ra >= rc) ra = rc - 1u;
    	if(ra == 0u) ra = 1u;

    	tc_pwm_init(TC2, 0, rc, ra);
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
