# !/bin/bash
# Install modifications of the UI

if test ! "$(which gnome-tweaks)"; then
    sudo apt-get install gnome-tweak-tool
    sudo apt install gnome-shell-extensions

    # Topbar with date, not only time
    gsettings set org.gnome.desktop.interface clock-show-date true

    mkdir -p ~/.{themes,icons,fonts}
    
    cd ~/.icons
    git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
    ~/.icons/la-capitaine-icon-theme/configure

    cd /tmp
    git clone git@github.com:paullinuxthemer/Mc-OS-themes.git
    mv Mc-OS-themes/Mc-OS-CTLina-Gnome-Dark-1.1 ~/.themes 
    mv Mc-OS-themes/McOS-CTLina-Gnome-1.1/ ~/.themes 
    rm -fr Mc-OS-themes
    
    # Add "SF Pro Display Regular" and "SF UI" fonts
    curl https://img2.allbestfonts.com/wp-content/uploads/2015/06/San-Francisco.zip -o sf.zip
    unzip sf.zip -d SF
    mv SF/San\ Francisco/pro/* ~/.fonts/
    mv SF/San\ Francisco/SFUIDisplay/* ~/.fonts 
    mv SF/San\ Francisco/SFUIText/* ~/.fonts
    rm -fr SF sf.zip

    echo "Launch 'gnome-tweaks' now to change the interface settings"
fi