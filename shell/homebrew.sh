#!/bin/bash

if test ! "$(which brew)"
then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

BREW_PACKAGES=(
	zsh
	git
	cig
	ack
	go
	mercurial
	tmux
	wget
	tree
	shellcheck
	s3cmd
	bash-completion
	caskroom/cask/brew-cask
	Caskroom/cask/licecap
	ImageMagick	# Needed for the "convert" command, to convert whiteboard photos into clean images
	unrar
	homebrew/php/php71
	#thefuck
	#Caskroom/cask/virtualbox
	Caskroom/cask/macdown
	#docker
	#docker-machine
	#mitmproxy
	httpie
)

for pkg in "${BREW_PACKAGES[@]}"
do
    echo "- Installing $pkg"
    brew install "$pkg"
done
