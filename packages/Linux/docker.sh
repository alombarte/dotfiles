#!/bin/bash

if test ! "$(type docker)"; then
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update -y
    apt-cache policy docker-ce
    sudo apt install docker-ce docker-compose -y
    sudo usermod -aG docker ${USER}
    sudo chown ${USER} /var/run/docker.sock
fi
