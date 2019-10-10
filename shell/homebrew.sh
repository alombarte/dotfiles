#!/bin/bash

if test ! "$(command -v brew)"
then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

BREW_PACKAGES=(
	zsh
	git
	cig
	ack
	jq
	ripgrep
	go
	mercurial
	wget
	tree
	shellcheck
	s3cmd
	bash-completion
	caskroom/cask/brew-cask
	ImageMagick	# Needed for the "convert" command, to convert whiteboard photos into clean images
	unrar
	#mitmproxy
	httpie
	ansible
	packer
	rclone
	hugo
	docker
	nmap
	graphviz
	heroku/brew/heroku
	nss # Network Security Services for mkcert
	mkcert
	kubernetes-helm
	textql

)

DESKTOP_APPS=(
	Caskroom/cask/iterm2
	Caskroom/cask/sublime-text
	Caskroom/cask/nvalt
	Caskroom/cask/textmate
	Caskroom/cask/slack
	Caskroom/cask/licecap
	Caskroom/cask/macdown
	Caskroom/cask/docker
	Caskroom/cask/spotify
	Caskroom/cask/google-chrome
	Caskroom/cask/sequel-pro
	Caskroom/cask/visual-studio-code
	Caskroom/cask/nomad
	Caskroom/cask/scout
	Caskroom/cask/skype
	Caskroom/cask/telegram
	Caskroom/cask/tunnelblick
)

echo "Installing command line applications"
for pkg in "${BREW_PACKAGES[@]}"
do
    echo "- Installing $pkg"
    brew install "$pkg"
done

echo "Now installing desktop applications (CTRL+C to skip)"
for pkg in "${DESKTOP_APPS[@]}"
do
    echo "- Installing desktop app $pkg"
    brew install "$pkg"
done
