#include "adc.h"

// initializes ADC controller
void adc_init(void)
{
    	// slow ADC clock is fine for a joystick.
    	// the lecture explicitly suggests something like 0xFF -> ~172 KHz.
    	uint32_t div = 0xFF;

    	// enables ADC peripheral clock
    	PMC->PMC_PCER1 |= (1U << (ADC_IRQn - 32));

    	// software reset first
    	ADC->ADC_CR = ADC_CR_SWRST;

    	// disables write protect
    	ADC->ADC_WPMR = 0x41444300;   // "ADC" in ASCII, WPEN = 0

    	// disables all channels
    	ADC->ADC_CHDR = 0xFFFF;

    	// clears mode / extended mode registers
    	ADC->ADC_MR  = 0;
    	ADC->ADC_EMR = 0;
 
       	//
	//by default ADC controller is on single-ended mode ==> no need to do anything about it
	//
	
    	// no offset 
    	ADC->ADC_COR = 0; 
    	// gain = 1 for all channels
    	ADC->ADC_CGR = 0;

    	// **---configures ADC:---**
    	// - software trigger only
    	// - slow prescaler
    	// - startup SUT64
    	// - settling AST17
    	// - allow per-channel analog settings
    	// - tracking time 3
    	// - transfer period 2
    	ADC->ADC_MR =
        	(div << ADC_MR_PRESCAL_Pos) |
                ADC_MR_STARTUP_SUT64 |
        	ADC_MR_SETTLING_AST17 |
        	ADC_MR_ANACH_ALLOWED |
        	ADC_MR_TRACKTIM(3) |
        	ADC_MR_TRANSFER(2);

    	// sets TAG in LCDR
    	ADC->ADC_EMR = ADC_EMR_TAG;
}

//starts conversion on ADC channel
void adc_enable(uint32_t channel)
{
	// checks for valid channel
	if(channel > 15u) return;
	// enables specified channel
	ADC->ADC_CHER = (1u << channel);  	
}

//stops conversion on ADC channel
void adc_disable(uint32_t channel)
{
	// checks for valid channel
	if(channel > 15u) return;
	// disables specified channel
	ADC->ADC_CHDR = (1u << channel);
}

//triggers next conversion
void adc_start(void)
{
	//starts conversion on all enabled channels (software trigger)
	ADC->ADC_CR = ADC_CR_START;
}

//
//checks if next value is available
//
uint32_t adc_status(uint32_t channel)
{
	// returns 1 if conversion for 'channel' is complete
	// returns 0 otherwise
	return ((ADC->ADC_ISR & (1u << channel)) >> channel); 
}

/*
uint32_t adc_read(uint32_t channel)
{
	static uint32_t latestSelectedChannel = -1;
	// Enable the corresponding channel
	if((ADC->ADC_CHSR & (1 << channel)) != 1) 
	{
		adc_enable(channel);
		if(latestSelectedChannel != (uint32_t)-1 && channel != latestSelectedChannel)
			adc_disable(latestSelectedChannel);
		latestSelectedChannel = channel;
		//g_pinStatus[60] = (g_pinStatus[60] & 0xF0) | PIN_STATUS_ANALOG;
	}

	// Start the ADC
	adc_start();
	
	// Wait for end of conversion
	while((ADC->ADC_ISR & ADC_ISR_DRDY) != ADC_ISR_DRDY);

	// Read the value
	return ADC->ADC_LCDR;
	//ulValue = mapResolution(ulValue, ADC_RESOLUTION, _readResolution);
}
*/	

//reads next sample, synchronously
uint32_t adc_read(uint32_t channel)
{
   
	// starts conversion (on all enabled channels)
	adc_start();

	// waits until conversion for 'channel' has been completed
	while(!adc_status(channel)) 
	{
	
	}

	// reads conversion result and returns it (channel's EOC bit is cleared as well)
	return ADC->ADC_CDR[channel];
}

