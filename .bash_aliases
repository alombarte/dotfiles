#!/bin/bash

# Show docker machine environmmentals
function docker-env() {
  echo "- Previous DOCKER environmental vars:"
  env | grep DOCKER
  eval "$(docker-machine env "${1:-default}")"
  echo "- Current DOCKER environmental vars:"
  env | grep DOCKER
}

alias dockerup="docker-machine start default; docker-env default"

# Convert a crappy picture of a Whiteboard into a better looking graph.
alias whiteboard-clean="bash ~/.dotfiles/utils/whiteBoardClean.sh"
alias g="git"
eval $(thefuck --alias)
