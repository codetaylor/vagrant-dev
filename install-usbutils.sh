#!/usr/bin/env bash
echo "Install usbutils"
set -x
export DEBIAN_FRONTEND=noninteractive

# Install usbutils for the lsusb command

sudo apt-get install usbutils -y