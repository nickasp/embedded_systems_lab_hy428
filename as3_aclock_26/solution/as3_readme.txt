#Assignment 3 2026

#Tsintzas Ioannis csd5305
#Aspridis Nikolaos csd5178


(5.1) pin 27 of PIOB ----> pin D13 
      pin 7 of PIOD  ----> pin D11
      pin 28 of PIOA ----> pin D0
      pin 21 of PIOC ----> pin D9
      pin 22 of PIOC ----> pin D8      
      pin 23 of PIOC ----> pin D7
      pin 16 of PIOA ----> pin A0

      ==> Peripherals A, B, C and D are needed ... 

(5.2) The LCD can operate at a maximum speed of 1/400ns = 2.5MHz, according to LCD12864 manual found online, with low time 200ns
      and high time 200ns as well.

(7.1) To which PIO and pin is the 5-position joystick connected?
      	The 5-position joystick is connected to pin no. 16 of PIO A.
      Which peripheral (A or B) for this PIO pin is the ADC ?
         Neither A nor B — the ADC uses the analog function X1 (on PA16 for signal AD7), that bypasses 
         peripherals A and B and connects pin PA16 directly to ADC module.
      Based on this pin, which ADC channel does the joystick use ?
	 The joystick uses ADC channel no. 7 (AD7).

(7.3) What sampling rate should you use for the joystick? Use the appropriate value for the PRESCALE
      parameter in ADC_MR.
	 As I read on the internet, a typical joystick needs only 50-100 samples per second to operate 
         as expected, as a human hand (which is very slow) is always operating it. Inside the atmel datasheet,
	 it is mentioned that PRESCAL can take values inside [0, 255] interval. When PRESCAL = 0, then the ADC
         controller operates as fast as possible (MCK/2), while when PRESCAL = 255, then the ADC controller 
         operates as slow as possible (MCK/512). MCK = 84MHz, as we already know from previous assignments
         ===> 84MHz / 512 = ~172KHz clock frequency. Also, startup (64) + tracktim (3) + transfer (2) + 
         conversion (12) = 84 ADC cycles are needed for each single conversion. 1/172KHz = ~5.8μs are needed 
         for a signle ADC cycle ===> 84*(5.8) = 487.2 μs = ~0.00049s are needed for a single sample. 
         ===> 1/(0.00049) = 1000/(0.49) = 2000/(0.98) = ~2000 samples per second, which is much faster than
	 the minimum of 50-100 samples per second needed. 

         As a result, I believe that the most appropriate value for the PRESCALE parameter in ADC_MR is 255 
         (MCK/512 clock frequency), as this clock frequency is more than sufficient for input sampling from
         the joystick (==> there is no need for a faster clock), as well as PRESCALE cannot take a greater 
         value than 255 (===> no ADC controller clock slower than MCK/512 frequency can be used).  
         
