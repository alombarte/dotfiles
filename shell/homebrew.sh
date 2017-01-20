#!/bin/bash

if test ! "$(which brew)"
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
	shellcheck
	s3cmd
	bash-completion
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
)

for pkg in "${BREW_PACKAGES[@]}"
do
    echo "- Installing $pkg"
    brew install "$pkg"
done
