#!/bin/bash

# Install Go Version Manager (gvm)
# bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
# source ~/.gvm/scripts/gvm`
# gvm install go1.4
# gvm use go1.4
# gvm install go1.5
# gvm use go1.5 --default

if test ! $(which brew)
then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

BREW_PACKAGES=(
	git
	cig
	go
	mercurial
	tmux
)

for pkg in ${BREW_PACKAGES[@]}
do
	echo "- Installing $pkg"
    brew install $pkg
done

echo "Installation finished"


cat <<EOF >> ~/.bash_profile
EOF
