#!/bin/bash

if test ! $(which brew)
then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

BREW_PACKAGES=(
	git
	cig
	ack
	go
	mercurial
	tmux
	wget
	tree
)

for pkg in ${BREW_PACKAGES[@]}
do
    echo "- Installing $pkg"
    brew install $pkg
done
