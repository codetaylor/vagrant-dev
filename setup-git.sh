#!/bin/bash
echo "Setup git"
set -x

# Reconfigure the git default branch name to 'main'
git config --global init.defaultBranch main