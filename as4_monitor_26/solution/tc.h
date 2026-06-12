#ifndef TC_H
#define TC_H

#include <stdio.h>
#include "system/sam3x8e.h"

// basic timer counter functions
void tc_init(Tc *tc, uint8_t chan, uint32_t rc);         // tc is TC0,TC1,TC2; c is channel 0,1,2; usa CLOCK1=MCK/2=42MHz; 
 														 // disable all interrupts; set RC to rc
void tc_enable(Tc *tc, uint8_t channel);                 // reset and start counting on timer tc (TC0,TC1,TC2), channel c (0,1,2)
void tc_disable(Tc *tc, uint8_t channel);                // stop counting on tc, channel c
void tc_spinus(Tc *tc, uint8_t channel, uint32_t us);    // spin for us usecs

//  ---- mine ---- //
void tc_spinuns(Tc *tc, uint8_t channel, uint32_t uns);  // spin for us unsecs
//  -------------- //

// interrupt generation
void tc_int_enable(Tc *tc, uint8_t channel, uint32_t t);   // enable interrupts for tc every t usecs uisng RC comparisons
void tc_int_disable(Tc *tc, uint8_t channel, uint32_t rc); // disable interrupts for tc and reset RC to rc 
                                                           // to avoid frequent wrap around
void tc_int_ack(Tc *tc, uint8_t channel);                  // ack an interrupt for tc by reading the status register

// PWM generation - same as tc_init() but setup RA, RC timer to generate PWM with parameters T,D on output PIOAx
void tc_pwm_init(Tc *tc, uint8_t c, uint32_t T, uint8_t D); 

// helper 
//uint32_t tc_periph_id(Tc *tc, uint8_t channel); // calculates one of ID_TC0... ID_TC8 as 27+tc*3+channel

#endif
