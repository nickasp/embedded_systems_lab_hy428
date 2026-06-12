#include "button.h"
#include "system/sam3x8e.h"

/*
 * DFR0029 Digital Push Button Configuration
 * Button is connected to pin D2 on Arduino Due
 * Pin D2 maps to PB25 on SAM3X8E (same as LED in your example)
 * 
 * Note: If using a different pin, adjust the port and pin constants below:
 * Arduino Pin -> SAM3X8E Port:Pin
 * D0 -> PA8      D1 -> PA9
 * D2 -> PB25     D3 -> PC28
 * D4 -> PA29     D5 -> PC25
 * D6 -> PC24     D12 -> PD8
 * etc.
 */

#define BUTTON_PORT PIOA
#define BUTTON_PIN  PIO_PA29
#define BUTTON_ID   ID_PIOA
#define PIN_NUMBER 29

void button_init(void)
{
    // Enable the peripheral clock for the port (PIOC)
    PMC->PMC_PCER0 |= (1U << BUTTON_ID);
    
    // Enable PIO control on the button pin
    BUTTON_PORT->PIO_PER = BUTTON_PIN;
    
    // Set pin as INPUT (disable output, enable input)
    BUTTON_PORT->PIO_ODR = BUTTON_PIN;      // Disable output driver
    BUTTON_PORT->PIO_IFER = BUTTON_PIN;     // Enable input filter (debounce)
    
    // disables pull-up arduino due resistors (button board has internal pull-down resistor) 
    BUTTON_PORT->PIO_PUDR = BUTTON_PIN;
}

uint8_t button_is_pressed(void)
{
    // DFR0029 is active-HIGH: output is HIGH when pressed, LOW when not pressed
    return (BUTTON_PORT->PIO_PDSR & BUTTON_PIN) ? 1 : 0;
}
