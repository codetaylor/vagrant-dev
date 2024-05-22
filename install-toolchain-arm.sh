#!/usr/bin/env bash
echo "Install toolchain ARM"
set -x
export DEBIAN_FRONTEND=noninteractive

# Install toolchain for ARM
sudo apt-get install -y binutils-arm-none-eabi gcc-arm-none-eabi gdb-multiarch libstdc++-arm-none-eabi-newlib libnewlib-arm-none-eabi