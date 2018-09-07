#!/bin/bash
set -e

shellcheck **/*.sh

if [ $? -eq 0 ]
then
  echo "Looking good!"
  exit 0
else
  echo "TEST FAILED :("
  exit 1
fi