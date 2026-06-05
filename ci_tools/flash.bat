@echo off
rem usage: flash.bat
setlocal

set "PROG_BIN=C:\Program Files\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin"
set "PATH=%PROG_BIN%;%PATH%"

rem --- EDIT: your ST-Link serial from --list ---
set "SN=066FFF485671664867224210"

set "IMAGE=%~dp0..\Debug\ci_cd_test.elf"

STM32_Programmer_CLI --connect port=SWD sn=%SN% --download "%IMAGE%" -hardRst