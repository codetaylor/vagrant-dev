#!/usr/bin/env bash
echo "Install git"
set -x
export DEBIAN_FRONTEND=noninteractive

# Get the latest version of git
# https://unix.stackexchange.com/a/170831

sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update -qq
sudo apt-get install git -y