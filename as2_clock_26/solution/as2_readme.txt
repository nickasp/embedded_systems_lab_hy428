#################################################
#						#
# hy428 ---> assignment 2 (2026)		#
# 						#
# Ioannis Tsintzas (csd5305)			#
# Nikolaos Aspridis (csd5178)			#
#						#
#################################################

(6.1) Which files in the 'system' directory contain definitions and which ones contain code that is executed ?
      List the files that contain code.

	---> system_sam3xa.c and startup.c files

(6.2) The MCK value refers to the ARM Cortex-M3 processor clock speed in SAM3X8E. What is the MCK value for your kit ?

	---> 84MHz

(6.3) How many timer counters does our system have ? Which file(s) in the "system" subdirectory of the assignment contain the #define definitions for the addresses and other parameters of TC ? To which timer counter and in which channel does TC5 correspond to ? How do you address in code the current value of (timer counter 0, channel 1) ?

	---> Our system has 3 timer counters (TC0, TC1 and TC2 modules). 

	---> files:	system/startup.c (vector table / handler definitions)
		 	system/system_sam3xa.c (#define for TC parameters)
			system/sam3x8e.h (#define for base address definitions)
			
			system/component/tc.h (software API for TCs)
			
			system/instance/tc0.h 
			system/instance/tc1.h
			system/instance/tc2.h
			
			system/rest/sam3x8e.h (interrupt number definitions / channel handlers' pointers)
			
			system/pio/sam3x8e.h (pio definitions for TCs)

	---> TC5 corresponds to timer counter no. 2 (TC1 module) and it corresponds to channel 5 (TC1 module has channels 3,4 and 5)) 

	---> you can address in code the current value of (timer counter 0, channel 1) the following way:
		uint32_t cv = TC0->TC_CHANNEL[1].TC_CV;	

(6.5) What is the largest delay you can achieve with a timer counter ?
	
	---> In our configuration, we are using the main clock's frequency , divided by 2, as the clock speed for our
	     timer counter. So the clock frequency for our timer counter is MCK/2 = 42MHz. So basically, this means
             that 44,040,192 ticks per second occur. An interrupt occurs / happens when CV==RC (based on our 
	     configuration) ===> now, the limit (ceiling) for the largest delay that can be achieved is the CV
	     register's size ===> the maximum value that can fit into CV register. CV is a 32-bit register, so
	     its maximum value is (2^32-1) = 4,294,967,295 ====> 4,294,967,295 ticks ====> 
             (4,294,967,295 / 44,040,192) seconds ===> ~ 97.524 seconds maximum delay can be achieved.
 
(7) Which file in the system directory contains the definitions for NVIC ?
	---> core_cm3.h
    Via which array variable declaration are the 32-bit priority registers of NVIC (IPR in the manual) viewed ?
        ---> volatile uint8_t  IP[240U];
    What is the size (bits) of each element and how many elements correspond to each 32-bit register ?
        ---> The size (bits) of each element is 8 bits (uint8_t) and 4 elements correspond to each 32-bit register.
    Which bits within each element are related to the interrupt priority ?
        ---> Bits [7:4] are related to the interrupt priority. Bits [3:0] are ignored.
    How do you need to index this array to set the priority p for an interrupt irq ?
        ---> IP[0+(irq*8)] = (p << 4u);

(7.1) The file system/sam3x8e.h defines all interrupt numbers as an enum type IRQn_Type. 
      
      How many interrupts (excluding processor exceptions) does NVIC handle ?
	---> 42 interrupts
      What values can priorities have ? Which one is higher ?
        ---> Priorities value is an integer value and can be inside [0,15] interval. The smallest the value, the higher
             the priority ===> 0 is the highest priority value. 

(8.2) Which interrupt handler is used by TC1 ? 
	---> void TC1_Handler(void); 
      Where is this handler defined and how is it placed in memory ?
	---> It is declared inside system/sam3x8e.h, but it is defined inside system/startup.c file. There is a vector table that
	     is being defined inside system/startup.c file as well, with pointers to each handler function. ".pfnTC1_Handler" field
	     of the vector table is assigned the starting memory address of the definition of tc1_handler function and this is how 
	     the handler is finally placed into memory.   
      When is this handler invoked during execution ?
	---> This handler is invoked each time TC1 module generates an interrupt and TC1 module's interrupts are enabled.
      How is this handler invoked ?
	---> TC1 module informs the processor that there is a pending interrupt and when the processor decides to handle it, it calls the
             function (the handler) pointed to by the pointer already assigned into ".pfnTC1_Handler" entry of the processor's vector table.

(8.3) How can you provide your own handler for the timer ?
	---> We can implement our own handler for (timer counter 0, channel 1) peripheral by writing the corresponding function 
             (the handler) and assigning a pointer to the (code of the) function into ".pfnTC1_Handler" field of the vector table.
             This way, the processor is going to execute our implementation whenever it decides to 'handle' an interrupt associated
	     with (timer counter 0, channel 1) peripheral.
      What does it mean for a handler to acknowledge a device interrupt reading the device SR ? Do you need to do this ?
	---> A processor interrupt is generated either by software, or by an external peripheral device. The processor is informed either 
	     way and handles the interrupt appropriately. In the case of the peripheral being the initiator, when the processor finishes
             handling the interrupt, it somehow needs to inform the peripheral about it. As a result, the processor proceeds to clear the 
             peripheral's status register bit (1 --> 0) to state (to the peripheral 'initiator') that the interrupt has been handled
             appropriately. So, a handler acknowledging a device interrupt reading the device SR means that the handler by itself is responsible
	     for the clearance of the peripheral/device's status register (note that according to M3-cortex processor manual, when the value 
             of the status register is being read out, the registered is being cleared/wiped out as well).

(9.2) To which PIO controller does TIOA6 connect ?
	---> TIOA6 connects to PIOC controller.
      Which pin on this PIO controller does it connect to ?
	---> It connects to pin 25 of PIOC controller.
      Which peripheral (A or B) on this pin does it correspond to ?
	---> It corresponds to peripheral B on this pin.   
