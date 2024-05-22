#!/usr/bin/env bash
echo "Compile openocd"
set -x

# Install hidapi
cd /home/vagrant
git clone https://github.com/signal11/hidapi.git
cd hidapi
./bootstrap
./configure
make
sudo make install
cd /home/vagrant
rm -rf hidapi

# Update system shared libray cache
sudo ldconfig

# Install openocd
cd /home/vagrant
wget -nv https://downloads.sourceforge.net/project/openocd/openocd/0.12.0/openocd-0.12.0.tar.gz
tar xfz openocd-0.12.0.tar.gz
cd openocd-0.12.0
./configure --enable-ftdi --enable-stlink --enable-cmsis-dap
make
sudo make install
cd /home/vagrant
rm -rf openocd-0.12.0
rm *.tar.gz