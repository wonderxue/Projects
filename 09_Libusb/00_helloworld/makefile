CC = gcc
PKGCFG = pkgconf
SRC = $(wildcard *.c)
OBJ = $(SRC:%.c=%.o)
TARGET = main

all: $(TARGET)

$(TARGET):$(OBJ)
	$(CC) $^ $$($(PKGCFG) --libs libusb-1.0) -o $@

%.o:%.c
	$(CC) -c $< $$($(PKGCFG) --cflags libusb-1.0) -o $@

.PHONY: help

help:
	@echo $(OBJ)