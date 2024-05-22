#!/usr/bin/env bash
echo "Install drivers"
set -x
export DEBIAN_FRONTEND=noninteractive

# Install additional drivers
# http://askubuntu.com/questions/541443/how-to-install-usbserial-and-ftdi-sio-modules-to-14-04-trusty-vagrant-box

# Update package lists
sudo apt-get update -qq

# Install extra drivers for Virtual Linux kernel image
sudo apt-get install -y linux-image-extra-virtual

# Install support for FTDI dongles
sudo modprobe ftdi_sio vendor=0x0403 product=0x6001