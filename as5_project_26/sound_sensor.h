#ifndef SOUND_SENSOR_H
#define SOUND_SENSOR_H

#include <stdint.h>

// Sensor is wired to Arduino DUE analog pin A10 = ADC channel 12
#define SOUND_ADC_CHANNEL   12

void     sound_sensor_init(void);
uint16_t sound_sensor_read(void);          // Returns 0–4095 (12-bit)
uint8_t sound_sensor_noise_detected(void); // checks for noise of more than 50% of the sound sensor's sensitivity 


#endif
