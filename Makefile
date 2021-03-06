.PHONY: all default install packages dotfiles

all: packages dotfiles

default: install

install: all

packages:
	bash packages/install.sh

dotfiles:
	# add aliases for dotfiles
	stow -v editors git term keyboard

	# Non public dotfiles
	cd ~/Dropbox && stow DOTFILES

	chmod 700 -R ~/.ssh
