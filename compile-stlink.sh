#!/usr/bin/env bash
echo "Compile stlink"
set -x

# Install stlink
cd /home/vagrant
wget -nv https://github.com/texane/stlink/archive/v1.1.0.tar.gz
tar xfz v1.1.0.tar.gz
cd stlink-1.1.0
./autogen.sh
./configure
make
sudo make install
sudo cp 49-stlink*.rules /etc/udev/rules.d/
cd /home/vagrant
rm -rf stlink-1.1.0
rm *.tar.gz