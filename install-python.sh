#!/usr/bin/env bash
echo "Install python"
set -x
export DEBIAN_FRONTEND=noninteractive

# Install python
sudo apt-get install -y python3.12 python3-numpy python3-scipy python3-matplotlib