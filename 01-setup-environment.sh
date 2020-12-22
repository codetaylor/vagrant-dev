#!/bin/bash

# set -x

echo 'PATH=$PATH:/vagrant/bin' >> /home/vagrant/.bashrc
echo 'source /vagrant/bin/git-prompt.sh'

# Reconfigure the git default branch name to 'main'
git config --global init.defaultBranch main