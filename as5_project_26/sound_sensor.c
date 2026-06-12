#include "sound_sensor.h"
#include "adc.h"
#include "system/sam3x8e.h"

/*
 * A10 = PB19 = ADC channel 12
 * Must disable PIO control on PB19 so ADC can read it
 */
#define SOUND_SENSOR_PORT   PIOB
#define SOUND_SENSOR_PIN    PIO_PB19
#define SOUND_SENSOR_ID     ID_PIOB

void sound_sensor_init(void)
{
    // Enable peripheral clock for PIOB
    PMC->PMC_PCER0 |= (1U << SOUND_SENSOR_ID);
    
    // Disable PIO control on PB19 - let ADC peripheral access it
    SOUND_SENSOR_PORT->PIO_PDR = SOUND_SENSOR_PIN;
    
    adc_enable(SOUND_ADC_CHANNEL);
}

uint16_t sound_sensor_read(void)
{
    return (uint16_t)(adc_read(SOUND_ADC_CHANNEL) & 0x0FFF);
}

// checks for noise of more than 50% of the sound sensor's sensitivity 
uint8_t sound_sensor_noise_detected()
{
	return sound_sensor_read() >= 1024 ? 1u : 0u; 
}
