.PHONY: all default install packages dotfiles sshkey

all: packages dotfiles sshkey

default: install

install: all

packages:
	for file in $(shell find $(CURDIR)/shell -type f); do \
		f=$$(basename $$file); \
		bash $$file; \
	done

dotfiles:
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitmodules" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done
	# Non public dotfiles
	for file in $(shell find ~/Dropbox/DOTFILES -name ".*" -not -name ".gitmodules" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done

	ln -s $(CURDIR) ~/.dotfiles

sshkey:
	ssh-add -K ~/.ssh/id_rsa
