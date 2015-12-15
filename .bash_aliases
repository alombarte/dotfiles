#!/bin/bash

# Show docker machine environmmentals
function dm-env() {
  echo "- Previous DOCKER environmental vars:"
  env | grep DOCKER
  eval "$(docker-machine env "${1:-default}")"
  echo "- Current DOCKER environmental vars:"
  env | grep DOCKER
}

alias dockerup="docker-machine start default; dm-env default"
