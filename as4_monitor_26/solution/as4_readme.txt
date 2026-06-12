Ioannis Tsintzas csd5305
Aspridis Nikolaos csd5178

(3.1) *** To which PIO, pin and peripheral do pins SDA and SCK map ? ***
	-- pin SDA maps to PIOB, pin 12 and peripheral A.
        -- pin SCK maps to PIOB, pin 13 and peripheral A.

(4.1) *** What is the device address when using I2C ? ***

      The BMX160/BMI160 I2C address depends on the logic level of the SDO ('Slave Address bit 0' (SA0)) pin.

	- If SDO is connected to GND, the 7-bit I2C address is 0x68.
	- If SDO is connected to VDDIO, the 7-bit I2C address is 0x69.

      Therefore, different BMX/BMI modules may use different I2C addresses because their board schematic 
      ties the SDO/SA0 pin either low or high. Also, for I2C mode the CSB pin must be tied to VDDIO.

      *** Which BMX160/BMI160 DATA registers contain the gyroscope data and in what form ? ***

      The gyroscope data are stored in the BMI160 DATA register block:

	- GYR_X: 0x0C (LSB), 0x0D (MSB)
	- GYR_Y: 0x0E (LSB), 0x0F (MSB)
	- GYR_Z: 0x10 (LSB), 0x11 (MSB)

      The values are 16-bit signed samples, stored little-endian (LSB first, then MSB).
      The chip ID register is 0x00 and should read as 0xD1.
