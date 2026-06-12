#ifndef I2C_H
#define I2C_H

#include <stdio.h>
#include "system/sam3x8e.h"

typedef enum {
	I2C_IDLE,
	I2C_WRITE,
	I2C_READ,
	I2C_WRITE_DMA,
	I2C_READ_DMA
}i2c_mode_t;  

extern volatile uint8_t t_done;

void i2c_init(void);

void i2c_write(uint8_t address, uint8_t *data, uint32_t len);		//synchronous write
void i2c_read(uint8_t address, uint8_t *data, uint32_t len);		//synchronous read

void i2c_write_async(uint8_t address, uint8_t *data, uint32_t len); //asynchronous write with interrupts
void i2c_read_async(uint8_t address, uint8_t *data, uint32_t len);  //asynchronous read with interrupts

void i2c_write_async_dma(uint8_t address, uint8_t *data, uint32_t len); //asynchronous write with DMA and interrupt completion
void i2c_read_async_dma(uint8_t address, uint8_t *data, uint32_t len); //asynchronous read with DMA and interrupt completion

#endif
