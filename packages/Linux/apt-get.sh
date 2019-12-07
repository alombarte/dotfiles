#!/bin/bash
# Installs all the software packages from the txt file and removes
# other default packages in the distro.

path=$(realpath $0)
dir=$(dirname $path)

# The TXT files can contain comments using # or empty lines
to_install=$(grep -v '^\s*$\|^\s*\#' $dir/../../linux-apt.txt)
to_remove=$(grep -v '^\s*$\|^\s*\#' $dir/../../linux-apt-uninstall.txt)

sudo apt-get update
sudo apt-get install -y $(< $to_install)
sudo apt-get remove -y $(< $to_remove)
sudo apt autoremove -y