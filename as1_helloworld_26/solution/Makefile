ARMBIN =  ../../dira/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-eabi/bin
BOSSAC = ../../dirb/bossac-1.7.0/bossac
SYSTEM_REPO = ../../system
PROGRAMMING_PORT = ttyACM0

BUILD_DIR = build
SRC_DIR = ./
SYSTEM_DIR = system

MCU_SPEC = cortex-m3
LD_SCRIPT = linker.ld

START_SCRIPT = startup.c
INIT_SCRIPT = system_sam3xa.c
TARGET = main

ASFLAGS += -c
ASFLAGS += -mcpu=$(MCU_SPEC)
ASFLAGS += -fmessage-length=0

CFLAGS += -mcpu=$(MCU_SPEC)
CFLAGS += -Wall
CFLAGS += -g
CFLAGS += -fmessage-length=0
CFLAGS += -specs=nosys.specs
#------ MINE -----------#
CFLAGS += -pedantic
#-----------------------#

LSCRIPT = $(SYSTEM_DIR)/$(LD_SCRIPT)
LFLAGS += -mcpu=$(MCU_SPEC)
LFLAGS += -Wall
LFLAGS += -specs=nosys.specs
LFLAGS += -nostdlib
LFLAGS += -lgcc
LFLAGS += -T$(LSCRIPT)
LFLAGS += -lc     

CC = $(ARMBIN)/arm-none-eabi-gcc
AS = $(ARMBIN)/arm-none-eabi-as
LD = $(ARMBIN)/arm-none-eabi-ld
OC = $(ARMBIN)/arm-none-eabi-objcopy
OD = $(ARMBIN)/arm-none-eabi-objdump
OS = $(ARMBIN)/arm-none-eabi-size

AS_SRC = display.s 
C_SRC  = $(START_SCRIPT) $(INIT_SCRIPT) main.c delay.c led.c
OBJS   = $(AS_SRC:%.s=$(BUILD_DIR)/%.s.o)
OBJS  += $(C_SRC:%.c=$(BUILD_DIR)/%.o)

all: clean bin download 

system: $(SYSTEM_REPO)
	ln -s $(SYSTEM_REPO) .	

bin: $(BUILD_DIR)/$(TARGET).bin

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
	$(OC) -S -O binary $^ $@
	$(OS) $^

$(BUILD_DIR)/$(TARGET).elf: $(OBJS)
	$(CC) $^ $(LFLAGS) -o $@

$(BUILD_DIR)/%.s.o: $(SYSTEM_DIR)/%.s
	$(CC) -x assembler-with-cpp $(ASFLAGS) $^ -o $@

$(BUILD_DIR)/%.s.o: $(SRC_DIR)/%.s
	$(CC) -x assembler-with-cpp $(ASFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: $(SYSTEM_DIR)/%.c
	$(CC) -c $(CFLAGS) $(INCLUDE) $< -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) -c $(CFLAGS) $(INCLUDE) $< -o $@

clean: 
	find . -name "*.o" -type f -delete
	find . -name "*.bin" -type f -delete
	find . -name "*.elf" -type f -delete

download: $(BUILD_DIR)/$(TARGET).bin
	stty -F /dev/$(PROGRAMMING_PORT) 1200
	$(BOSSAC) -i --port=$(PROGRAMMING_PORT) -U false -e -w -v -b $< -R

download_win: $(BUILD_DIR)/$(TARGET).bin
	mode $(PROGRAMMING_PORT):1200
	timeout 1
	$(BOSSAC) -i --port=$(PROGRAMMING_PORT) -U false -e -w -v -b $< -R
