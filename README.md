```
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

[![Build Status](https://travis-ci.org/alombarte/dotfiles.svg?branch=master)](https://travis-ci.org/alombarte/dotfiles)

My collection of **dotfiles, software and scripts** used in Mac and Linux. When I have a new machine I just run `make`.


# Installation
Clone the repository under `~/.dotfiles`:

    git clone https://github.com/alombarte/dotfiles.git ~/.dotfiles

Dependencies:

- `make`
- `curl`
- `git`

Install all **selected software** (you might want to change it):

	make packages

    # or alternatively
    
    ./packages/install.sh

Install a group of dotfiles in the HOME dir:
   
    stow term git


## Software installed via package systems
All the software installed through package systems (brew, apt, snap..) is declared in `.txt` files. Edit these files to select what is installed in your computer. Mac systems use only `brew`, while Linux use `apt` and `snap`.

**Linux**:

- linux-apt-uninstall.txt - Software that comes with Linux distributions, such as card games, that I don't need. Will be REMOVED.
- linux-apt.txt - All the software installed using `apt-get install`
- linux-brew.txt - Packages installed via [Snap](https://snapcraft.io/store)

**Mac**:

- mac-brew.txt - List of software installed using [brew](https://brew.sh/)

Custom software (under `packages`):

- `common`: software installed in both Mac and Linux
- `Linux`
- `Darwin` (Mac)

## Dotfiles
The dotfiles are managed using [stow](https://www.gnu.org/software/stow/), a small utility that manages symlinks for you.