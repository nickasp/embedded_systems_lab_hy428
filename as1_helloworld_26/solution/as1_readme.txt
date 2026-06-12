Aspridis Nikolaos csd5178

Answers to questions:

3.1) Instruction-Set-Architecture (ISA):
	Thumb-2 (ISA) subset consisting of all base Thumb-2 instructions, 16-bit and 32-bit.

     Clock frequency:
 	80MHz

3.2) Flash memory, Read-Only-Memory (ROM) and Static Random-Access-Memory (SRAM), as well as 
     Single Data Rate Synchronous Dynamic Random Access Memory (SDR-SDRAM).


5.1) as1_helloworld_26/solution/main.c 

5.2) as1_helloworld_26/solution/system 
     as1_helloworld_26/solution 

5.3) Yes, the compilation process links agains libgcc library (via the -lgcc linker flag). 
     This library is located inside the ARM GNU toolchain directory, under the lib/gcc/arm-none-eabi/
     path. The standard C library is not used, since the Makefile specifies -nostdlib 


