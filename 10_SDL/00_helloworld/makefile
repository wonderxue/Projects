CC = gcc-12
PKGCFG = pkgconf
SRC = $(wildcard *.c)
OBJ = $(SRC:%.c=%.o)
TARGET = main1

all: $(TARGET)

$(TARGET):$(OBJ)
	$(CC) $^ -F /Library/Frameworks -framework SDL3 -o $@

%.o:%.c
	$(CC) -c $< -framework sdl3 -o $@

.PHONY: help

help:
	@echo $(OBJ)