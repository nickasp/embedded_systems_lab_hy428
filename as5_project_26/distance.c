#include "distance.h"
#include "adc.h"

// initializes urm09 ultrasonic sensor --> plug this on A6 arduino pin
void distance_init()
{
	// clocks PIOA
	PMC->PMC_PCER0 |= (1u << ID_PIOA);
        // disables PIO control on PA3 () - let ADC peripheral access it
    	PIOA->PIO_PDR = PIO_PA3;
 
	adc_enable(1);
}

// returns distance computed from urm09 ultrasonic sensor
static inline float urm09_distance_cm()
{
	uint32_t adc_raw = adc_read(1) & 0xFFF;
	return (((float)adc_raw * URM09_MAX_CM) / ADC_MAX_12BIT);
}

// checks for obstacle into 20cm perimeter
// returns 1 (obstacle found) or 0 (obstacle not found)
uint8_t urm09_obstacle_detected()
{
	return urm09_distance_cm() <= OBSTACLE_LIMIT_CM ? 1u : 0u;
}
