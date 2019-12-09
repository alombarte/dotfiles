#!/bin/bash

TMP_FONTS_DIR=/tmp/powerline-fonts

if test ! "$(fc-list | grep Powerline)"; then
	echo "Installing Powerline fonts (https://github.com/powerline/fonts)"
	git clone https://github.com/powerline/fonts.git ${TMP_FONTS_DIR}
	bash ${TMP_FONTS_DIR}/install.sh
	rm -fr ${TMP_FONTS_DIR}
else
	echo "Powerline patched fonts already installed"
fi
