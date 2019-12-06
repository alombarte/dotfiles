# !/bin/bash
# Software I don't need at all

PACKAGES=(
    thunderbird
    gnome-mines
    gnome-mahjongg
    aisleriot
    ubuntu-web-launchers # Amazon link - adware
 )

 for pkg in "${PACKAGES[@]}"
 do
     sudo apt-get remove "$pkg" -y
 done

