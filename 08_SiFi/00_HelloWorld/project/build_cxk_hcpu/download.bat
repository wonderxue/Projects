set WORK_PATH=%~dp0
set CURR_PATH=%cd%
cd %WORK_PATH%
jlink.exe -device SF32LB52X_NAND -CommandFile download.jlink
cd %CURR_PATH%
