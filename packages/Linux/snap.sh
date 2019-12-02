#!/bin/bash

PACKAGES=(
spotify
simplenote
)

PACKAGES_CLASSIC=(
slack
aws-cli
ripgrep
go
code
skype
)

sudo apt-get update

for pkg in "${PACKAGES[@]}"
do
    echo "====================> $pkg"
    sudo snap install $pkg
done

for pkg in "${PACKAGES_CLASSIC[@]}"
do
    echo "====================> $pkg"
    sudo snap install $pkg --classic
done

