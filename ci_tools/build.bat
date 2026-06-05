@echo off
rem usage: build.bat
setlocal

rem --- EDIT THESE TWO LINES to your actual paths ---
set "TOOLCHAIN_BIN=D:\Embedded\STM32CubeIDE_2.0.0\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.win32_1.0.100.202509120712\tools\bin"
set "MAKE_BIN=D:\Embedded\STM32CubeIDE_2.0.0\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.make.win32_2.2.0.202409170845\tools\bin"

set "PATH=%TOOLCHAIN_BIN%;%MAKE_BIN%;%PATH%"

arm-none-eabi-gcc --version
make --version

rem build the Debug configuration using CubeIDE's generated makefile
cd /d "%~dp0..\Debug"

make -j4 all