#!/bin/bash

if test ! "$(docker --version| grep 'Docker version')"; then
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update
    apt-cache policy docker-ce
    sudo apt install docker-ce docker-compose -y
    sudo usermod -aG docker ${USER}
    sudo chown ${USER} /var/run/docker.sock
fi