#ifndef ADC_H
#define ADC_H

#include <stdio.h>
#include "system/sam3x8e.h"

void adc_init(void); 					//setup ADC
void adc_enable(uint32_t channel); 		//start conversion on ADC channel
void adc_disable(uint32_t channel);		//stop conversion on ADC channel
void adc_start(void);					//trigger next coversion
uint32_t adc_status(uint32_t channel);	//check if next value is available
uint32_t adc_read(uint32_t channel);	//read next sample, synchronously

#endif
