#!/usr/bin/env bash
echo "Install unzip"
set -x
export DEBIAN_FRONTEND=noninteractive

# Install unzip
sudo apt-get install -y unzip