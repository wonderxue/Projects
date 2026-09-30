@echo off
title=uart download
set WORK_PATH=%~dp0
set CURR_PATH=%cd%
cd %WORK_PATH%
:start
echo,
echo      Uart Download
echo,
set /p input=please input the serial port num:
goto download
:download
echo com%input%
sftool -p COM%input% -c SF32LB52 -m nand write_flash "bootloader/bootloader.bin@0x62080000" "main.bin@0x620A0000" "ftab/ftab.bin@0x62000000"

if "%ENV_ROOT%"=="" pause

