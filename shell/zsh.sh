#!/bin/bash

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


if [ ! -d "~/.zsh" ]; then
	git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi


