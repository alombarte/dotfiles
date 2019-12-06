#!/bin/bash
# Installs all the software packages from the txt file and removes
# other default packages in the distro.

path=$(realpath $0)
dir=$(dirname $path)

# The TXT files can contain comments using #
to_install=$(grep -v '^#' $dir/apt-packages-install.txt)
to_remove=$(grep -v '^#' $dir/apt-packages-uninstall.txt)

sudo apt-get update
sudo apt-get install -y $(< $to_install)
sudo apt-get remove -y $(< $to_remove)
sudo apt autoremove -y