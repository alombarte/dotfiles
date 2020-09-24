#!/bin/bash


realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

path=$(realpath $0)
dir=$(dirname $path)

if test ! "$(command -v brew)"
then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

echo "Path $0 , $path"
# The TXT files can contain comments using # or empty lines
to_install=$(grep -v '^\s*$\|^\s*#\|^$' $dir/../../mac-brew.txt)

while read -r pkg; do
    echo "- Installing $pkg"
    brew install "$pkg"
done <<< "$to_install"
