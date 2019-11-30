#!/bin/bash

OS=`uname`
DIR=$(dirname $0)

case $OS in
Linux*)
  ;;
Darwin*)
  ;;
*)
  Message="Unsupported operative system $OS. Expected 'Linux' or 'Darwin'"
  exit 1
  ;;
esac

# Scripts for both operating systems.
for script in $(find $DIR/packages/common -type f); do
    f=$(basename $script);
    bash $script;
done

# Specific packages for Linux or Mac
for script in $(find $DIR/packages/$OS -type f); do
    f=$(basename $script);
    bash $script;
done