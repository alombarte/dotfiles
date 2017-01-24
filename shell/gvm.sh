#!/bin/bash
# Installation of the Go Version Manager and the ZSH plugin
# Install GVM
[[ ! -d "$HOME/.gvm" ]] && GVM_NO_UPDATE_PROFILE=1 GVM_NO_GIT_BAK=1 zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

ZSH_PLUGIN="$HOME/.oh-my-zsh/custom/plugins/zsh-gvm-plugin"
[[ ! -d "$ZSH_PLUGIN" ]] && git clone https://github.com/dgnest/zsh-gvm-plugin $ZSH_PLUGIN
