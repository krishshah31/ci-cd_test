#!/bin/bash
set -e
PROG="/opt/STM32CubeProgrammer/bin/STM32_Programmer_CLI"
SN="066FFF485671664867224210"
IMAGE="$(dirname "$0")/../Debug/ci_cd_test.elf"
"$PROG" --connect port=SWD sn="$SN" --download "$IMAGE" -hardRst