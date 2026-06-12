#ifndef GYROSCOPE_H
#define GYROSCOPE_H

#include <stdio.h>
#include "system/sam3x8e.h"

struct gyroscope{
    uint16_t xraw, yraw, zraw;
    float x, y, z;
};
extern struct gyroscope gyro;

void gyro_init(void);			 //initialize the gyroscope over I2C
uint8_t gyro_idread();			 //read the id from the device
void gyro_regwrite(uint8_t addr, //write a gyro control register on the device
				   uint8_t val);	
void gyro_regread(uint8_t addr,	 //read a gyro control register from the device
                  uint8_t *val, 
				  uint32_t len);	
struct gyroscope gyro_read(void);//read current gyro data from the device and fill in the global variable gyro

#endif
