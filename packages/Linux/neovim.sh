#!/bin/sh

wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xvfz nvim-linux64.tar.gz
mv nvim-linux64 /home/$USER/.local/nvim
ln -s /home/$USER/.local/nvim/bin/nvim /home/$USER/.local/bin/nvim


