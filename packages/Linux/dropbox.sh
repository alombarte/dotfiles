#!/bin/bash

if [ ! -d "$HOME/.dropbox-dist" ]; then
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd &
    echo "Consider enabling auto startup in Dropbox settings"
fi
