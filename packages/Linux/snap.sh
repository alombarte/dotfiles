#!/bin/bash
# Installs all the software packages from the txt file and removes
# other default packages in the distro.

path=$(realpath $0)
dir=$(dirname $path)

# The TXT files can contain comments using # or empty lines
to_install=$(grep -v '^\s*$\|^\s*\#' $dir/../../packages-snap.txt)

while read -r pkg; do
    sudo snap install $pkg
done <<< "$to_install"
