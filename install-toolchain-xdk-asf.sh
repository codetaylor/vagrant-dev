#!/usr/bin/env bash
echo "Install toolchain xdk-asf"
set -x

# Install ASF
cd /home/vagrant
wget -nv https://ww1.microchip.com/downloads/en/DeviceDoc/asf-standalone-archive-3.52.0.113.zip
unzip -q asf-standalone-archive-3.52.0.113.zip
sudo mv xdk-asf-3.52.0/ /usr/local/xdk-asf-3.52.0/
rm *.zip
ln -s /usr/local/xdk-asf-3.52.0 /usr/local/xdk-asf