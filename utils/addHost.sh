#!/bin/sh
# Adds the IP address of a host from a specific name server that is not added to system's resolution
set -e

HOST=$1
IP=$(dig "$HOST" @192.168.1.1 | grep "IN A" | awk '{print $5}')
echo "$IP  $HOST" | sudo tee -a /etc/hosts

