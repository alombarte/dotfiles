#!/bin/bash

PACKAGES=(
# Basics
git wget curl
terminator xclip fonts-powerline
jq 
rclone
# VPN
openvpn network-manager-openvpn network-manager-openvpn-gnome
)

sudo apt-get update

for pkg in "${PACKAGES[@]}"
do
    echo "==================== INSTALLING ===================="
    echo "$pkg"
    echo "===================================================="
    sudo apt-get install $pkg -y
done

