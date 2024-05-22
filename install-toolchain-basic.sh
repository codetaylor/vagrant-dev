#!/usr/bin/env bash
echo "Install toolchain basic"
set -x
export DEBIAN_FRONTEND=noninteractive

# Install basic development tools
sudo dpkg --add-architecture i386
sudo apt-get update -qq
sudo apt-get install -y build-essential autotools-dev autoconf pkg-config libusb-1.0-0 libusb-1.0-0-dev libftdi1 libftdi-dev libc6:i386 libncurses5:i386 libstdc++6:i386 cowsay figlet libtool libudev-dev