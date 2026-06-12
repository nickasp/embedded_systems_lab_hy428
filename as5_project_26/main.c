#include "adc.h"
#include "distance.h"
#include "sound_sensor.h"
#include "sound.h"
#include "button.h"
#include "led.h"
#include "tc.h"

#include "system/sam3x8e.h"


int main(void)
{
	adc_init();           // ADC is being initialised (needed both for the ultrasonic, and for the sound sensor)	
	distance_init();      // analog ultrasonic sensor is configured
	sound_sensor_init();  // sound sensor is configured
	sound_init();         // digital speaker is configured
	button_init();        // digital button is configured
	led_init();	      // digital led is configured
	tc_init(TC2, 1, 100); // timer counter necessary for spins is configured

    	// main loop
	while(1) 
    	{
		if(urm09_obstacle_detected() || sound_sensor_noise_detected())
		//if(sound_sensor_noise_detected())
		//if(urm09_obstacle_detected())
		{
            		// movement (ultrasonic sensor) -/- noise (sound sensor) was detected
			// alarm starts ringing and led starts blinking 
			// up until the moment the yellow button is being pressed once.
			sound_start(330, 30);
			while(!button_is_pressed())
			{
				led_on();
				tc_spinus(TC2, 1, 250000);
				led_off();
				tc_spinus(TC2, 1, 250000);
			}
			sound_stop();	            
		}
	}
    
    	return 0;
}

