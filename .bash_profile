#!/bin/bash

# Load all bash_* files (bash_extra not under version control)
for file in ~/.bash_{prompt,completion,aliases,exports,extra}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file


[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Bash completion script (homebrew)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

#Docker
#docker-machine start default
# eval "$(docker-machine env default)"

# set 256 color profile where possible
#if [[ $COLORTERM == gnome-* && $TERM == xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
#    export TERM=gnome-256color
#elif infocmp xterm-256color >/dev/null 2>&1; then
#    export TERM=xterm-256color
#fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
