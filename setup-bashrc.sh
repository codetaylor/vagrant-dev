#!/usr/bin/env bash
echo "Setup bashrc"
set -x

# Set default language
echo 'export LC_ALL=en_US.UTF-8' >> /home/vagrant/.bashrc
echo 'export LANGUAGE=en_US' >> /home/vagrant/.bashrc

# Add "." to PYTHONPATH
echo 'export PYTHONPATH=.:$PYTHONPATH' >> /home/vagrant/.bashrc
echo 'export ASFPATH=/usr/local/xdk-asf' >> /home/vagrant/.bashrc

# Add bin tools to the path
echo 'PATH=$PATH:/vagrant/bin' >> /home/vagrant/.bashrc

# Add local lib path (hidapi -> openocd)
echo 'PATH=$PATH:/usr/local/lib' >> /home/vagrant/.bashrc

# Configure the bash prompt for git
echo 'source /vagrant/bin/git-prompt.sh' >> /home/vagrant/.bashrc