#ifndef __DISTANCE_H__
#define __DISTANCE_H__

#include <stdio.h>
#include "system/sam3x8e.h"

#define URM09_MAX_CM 520u
#define ADC_MAX_12BIT 4095u
#define OBSTACLE_LIMIT_CM 20u

// initializes urm09 ultrasonic sensor
void distance_init(void);

// checks for obstacle into 20cm perimeter
// returns 1 (obstacle found) or 0 (obstacle not found)
uint8_t urm09_obstacle_detected(void);

#endif // __DISTANCE_H__
