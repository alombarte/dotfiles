.PHONY: all default install packages dotfiles sshkey os

all: packages dotfiles sshkey os

default: install

install: all

packages:
	bash packages.sh

dotfiles:
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".git" -not -name ".*.swp" -not -name ".travis.yml"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done
	# Non public dotfiles
	for file in $(shell find ~/Dropbox/DOTFILES -maxdepth 1 -name ".*"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done

	if [ -f ~/.dotfiles ] ; then ln -s $(CURDIR) ~/.dotfiles; fi

sshkey:
	ssh-add -K ~/.ssh/id_rsa
