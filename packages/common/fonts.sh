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
usr_font_dir="${usr_share_dir}/Myfonts"
mkdir -p "$usr_font_dir"

cd "$TMP_FONTS_DIR" || exit 1

nerd_fonts=(
    VictorMono
    Meslo
    Ubuntu
    Inconsolata
    )

install_font() {
    url=$1
    zip="${url##*/}"
    font_name="${zip%.*}"
    echo "Installing font $font_name from zip file $zip"
    if test ! "$(fc-list | grep $font_name)"; then
        curl -OL "$url"
        unzip -o "$zip"
        rm "$zip"
        echo "Copying $font_name to $usr_font_dir"
        mv * "$usr_font_dir/"
    else
        echo "Font $font_name already installed"
    fi
}

for i in "${nerd_fonts[@]}"; do
    install_font "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$i.zip"
done

# IBM Plex font
install_font "https://github.com/IBM/plex/releases/download/@ibm/plex-mono@1.1.0/ibm-plex-mono.zip"