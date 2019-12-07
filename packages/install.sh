#!/bin/bash

OS=$(uname)
DIR=$(dirname "$0")

case $OS in
Linux*)
  ;;
Darwin*)
  ;;
*)
  echo "Unsupported operative system $OS. Expected 'Linux' or 'Darwin'"
  exit 1
  ;;
esac

# Scripts for both operating systems.
find "$DIR/common" -type f -name '*.sh' -exec bash {} \;

# Specific packages for Linux or Mac
find "$DIR/$OS" -type f -name '*.sh' -exec bash {} \;