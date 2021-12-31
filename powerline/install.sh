#!/bin/sh
#
# Powerline fonts - useful for decent displays in iterm2 (and terminal)
#
# Various ones used - Menlo, Monaco, Roboto Mono

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

cp "Fira Code Medium Nerd Font Complete.ttf" "$HOME/Library/Fonts/"
