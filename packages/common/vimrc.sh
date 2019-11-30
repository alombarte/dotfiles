#!/bin/bash

if [[ ! -e ~/.vim_runtime ]]; then
    git clone --depth=1 https://github.com/alombarte/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
else
    echo "Vim already installed"
fi
