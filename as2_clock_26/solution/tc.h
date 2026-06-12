#ifndef __TC_H__
#define __TC_H__

#include "system/sam3x8e.h"

void tc_init(Tc *tc, uint8_t chan, uint32_t rc);
void tc_enable(Tc *tc, uint8_t channel);
void tc_disable(Tc *tc, uint8_t channel);
void tc_spinus(Tc *tc, uint8_t channel, uint32_t us);

void tc_int_enable(Tc *tc, uint8_t ch, uint32_t t);
void tc_int_disable(Tc *tc, uint8_t ch, uint32_t rc);
void tc_int_ack(Tc *tc, uint8_t ch);
void tc_pwm_init(Tc *tc, uint8_t ch, uint32_t T, uint8_t D);

#endif
