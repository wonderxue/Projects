CROSS-COMPILER = /Users/wonderxue/Desktop/ToolChains/RISC-V/RISC-V_Embedded_GCC12/bin/riscv-wch-elf-
CC = $(CROSS-COMPILER)gcc
AS = $(CROSS-COMPILER)as
CXX = $(CROSS-COMPILER)g++
LD = $(CROSS-COMPILER)ld
OBJCOPY = $(CROSS-COMPILER)objcopy
TOOLS = python3 /Users/wonderxue/Desktop/Projects/00_Code/01_GD32_Tools/gd32_tools.py

SDK_PATH = /Users/wonderxue/Desktop/SDKs/GD32VW55X/GD32VW55x_Firmware_Library_V1.4.0/Firmware
TARGET = main
INC = inc
SRC = src
LDS = lds
BUILD =build
BIN = bin

C_SRC = $(notdir $(wildcard $(SRC)/*.c)  \
				$(wildcard $(SDK_PATH)/GD32VW55x_standard_peripheral/*.c)\
				$(wildcard $(SDK_PATH)/GD32VW55x_standard_peripheral/Source/*.c))
CXX_SRC = $(notdir $(wildcard $(SRC)/*.cpp))
ASM_SRC = $(notdir $(wildcard $(SRC)/*.S))

OBJ = 	$(patsubst %.c, $(BUILD)/%.o, $(C_SRC))  	\
		$(patsubst %.cpp, $(BUILD)/%.o, $(CXX_SRC))	\
		$(patsubst %.S, $(BUILD)/%.o, $(ASM_SRC))	


CFLAGS = \
	-I$(INC) \
	-I$(SDK_PATH)/RISCV/drivers \
	-I$(SDK_PATH)/GD32VW55x_standard_peripheral \
	-I$(SDK_PATH)/GD32VW55x_standard_peripheral/include \
	-march=rv32imafdc -mcmodel=medany -msmall-data-limit=8 -mdiv -mabi=ilp32d \
	-ffunction-sections -fdata-sections


CXXFLAGS = \
	-I$(INC) \
	-I$(SDK_PATH)/RISCV/drivers \
	-I$(SDK_PATH)/GD32VW55x_standard_peripheral \
	-I$(SDK_PATH)/GD32VW55x_standard_peripheral/include \
	-march=rv32imafdc -mcmodel=medany -msmall-data-limit=8 -mdiv -mabi=ilp32d \
	-ffunction-sections -fdata-sections


LDFLAGS = \
	-T $(LDS)/GD32VW553xI.lds \
	-Map=$(BIN)/$(TARGET).map  \
	-gc-sections \
	-L/Users/wonderxue/Desktop/ToolChains/RISC-V/RISC-V_Embedded_GCC12/riscv-wch-elf/lib/rv32imafdc_zicsr/ilp32d \
	-lc_nano


All: BuildPath $(BIN)/$(TARGET)

$(BIN)/$(TARGET): $(OBJ)
	$(LD) $^ $(LDFLAGS) -o $@.elf
	$(OBJCOPY) -O binary $@.elf $@.bin

$(BUILD)/%.o:$(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/%.o:$(SDK_PATH)/GD32VW55x_standard_peripheral/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/%.o:$(SDK_PATH)/GD32VW55x_standard_peripheral/Source/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/%.o:$(SRC)/%.cpp
	$(CXX) $(CFLAGS) -c $< -o $@

$(BUILD)/%.o:$(SRC)/%.S
	$(CC) $(CFLAGS) -c $< -o $@

BuildPath:
	@echo mkdir
	@mkdir -p $(BUILD)
	@mkdir -p $(BIN)
.PHONY: help clean

help:
	@echo $(C_SRC) $(OBJ)

clean:
	@rm ./$(BUILD)/*
	@rm ./$(BIN)/*

flash:
	$(TOOLS) flash -i $(BIN)/$(TARGET).bin