#!/usr/bin/env bash
echo "Setup USB devices"
set -x

# Allow non-root users to access USB devices such as Atmel AVR and Olimex
# programmers, FTDI dongles...
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="15ba", ATTRS{idProduct}=="0003", GROUP="users", MODE="0666"' >> /etc/udev/rules.d/60-programmers.rules #Olimex OpenOCD JTAG
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="15ba", ATTRS{idProduct}=="002a", GROUP="users", MODE="0666"' >> /etc/udev/rules.d/60-programmers.rules #Olimex OpenOCD JTAG ARM-USB-TINY-H
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="15ba", ATTRS{idProduct}=="002b", GROUP="users", MODE="0666"' >> /etc/udev/rules.d/60-programmers.rules #Olimex OpenOCD JTAG ARM-USB-OCD-H
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2104", GROUP="users", MODE="0666"' >> /etc/udev/rules.d/60-programmers.rules #AVRISP mkII
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2141", GROUP="users", MODE="0666"' >> /etc/udev/rules.d/60-programmers.rules #Atmel-ICE
echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="2341", ATTRS{idProduct}=="0043", GROUP="users", MODE="0666"' >> /etc/udev/rules.d/60-programmers.rules #Arduino
echo 'SUBSYSTEMS=="usb", KERNEL=="ttyUSB*", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", GROUP="users", MODE="0666", SYMLINK+="ftdi-usbserial"' >> /etc/udev/rules.d/60-programmers.rules
sudo udevadm control --reload-rules
sudo udevadm trigger