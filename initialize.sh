#!/usr/bin/env bash
echo "Initialize"
set -x

# Remove unnecessary locales
# https://askubuntu.com/questions/1301908/locale-gen-generates-not-selected-locales
sudo apt-get purge -y language-pack-en language-pack-en-base language-pack-gnome-en language-pack-gnome-en-base

sudo locale-gen en_US
sudo locale-gen en_US.UTF-8

sudo dpkg-reconfigure --frontend noninteractive locales
sudo update-locale LC_ALL=en_US.UTF-8

. /etc/default/locale
locale