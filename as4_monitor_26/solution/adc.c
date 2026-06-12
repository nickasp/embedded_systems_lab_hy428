#include "adc.h"

void adc_init(void){
	uint32_t div = 0x00;							//set this value properly
    PMC->PMC_PCER1 |= (1U << (ADC_IRQn - 32));      //enable ADC
    ADC->ADC_MR  |= (div << ADC_MR_PRESCAL_Pos);	//prescal_val = (SystemCoreClock/(clk*2))-1;
    ADC->ADC_MR  |= ADC_MR_STARTUP_SUT64;           //set startup time
    ADC->ADC_MR  |= ADC_MR_SETTLING_AST17;          //set settling time
    ADC->ADC_MR  |= ADC_MR_ANACH_ALLOWED;           //allow different settings for each channel
    ADC->ADC_MR  |= ADC_MR_TRACKTIM(3);             //set tracking time
    ADC->ADC_MR  |= ADC_MR_TRANSFER(2);             //set transfer period
    ADC->ADC_EMR |= ADC_EMR_TAG;                    //enable tag
    ADC->ADC_CR  |= ADC_CR_SWRST;                   //sofware reset
    return;
}
