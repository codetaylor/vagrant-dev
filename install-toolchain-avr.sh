#!/usr/bin/env bash
echo "Install toolchain AVR"
set -x
export DEBIAN_FRONTEND=noninteractive

# Install development tools for avr
sudo apt-get install -y gcc-avr binutils-avr avr-libc avrdude