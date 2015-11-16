#!/bin/bash

# Load all bash_* files (bash_extra not under version control)
for file in ~/.bash_{prompt,completion,exports,extra}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file


[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

#Docker
#docker-machine start default
# eval "$(docker-machine env default)"

# set 256 color profile where possible
#if [[ $COLORTERM == gnome-* && $TERM == xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
#    export TERM=gnome-256color
#elif infocmp xterm-256color >/dev/null 2>&1; then
#    export TERM=xterm-256color
#fi
