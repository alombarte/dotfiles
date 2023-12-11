#!/bin/bash

TMP_FONTS_DIR=/tmp/nerd-fonts
mkdir -p "$TMP_FONTS_DIR"

if [[ $(uname) == 'Darwin' ]]; then
  # MacOS
  usr_share_dir="$HOME/Library/Fonts"
else
  # Linux
  usr_share_dir="$HOME/.local/share/fonts"
  if [ -n "${XDG_DATA_HOME}" ]; then
   usr_share_dir="${XDG_DATA_HOME}/fonts"
  fi
fi
usr_font_dir="${usr_share_dir}/NerdFonts"
mkdir -p "$usr_font_dir"

cd "$TMP_FONTS_DIR" || exit 1

fonts=(
    VictorMono
    Meslo
    Ubuntu
    Inconsolata
    )
for i in "${fonts[@]}"; do
    if test ! "$(fc-list | grep $i)"; then
        echo "Installing font $i"
        curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$i.zip"
        unzip -o "$i.zip"
        rm "$i.zip"
        echo "Copying font to $usr_font_dir"
        mv * "$usr_font_dir/"
    else
        echo "Font $i already installed"
    fi
done
