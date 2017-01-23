#!/bin/bash

# Install GVM
[[ ! -d "$HOME/.gvm" ]] && GVM_NO_UPDATE_PROFILE=1 GVM_NO_GIT_BAK=1 bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
