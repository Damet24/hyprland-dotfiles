#!/bin/bash

DOTFILES=~/dotfiles/config/

cp -r ~/.config/hypr/ $DOTFILES
cp -r ~/.config/rofi/ $DOTFILES
cp -r ~/.config/kitty/ $DOTFILES
cp ~/.config/starship.toml $DOTFILES
cp ~/.zshrc $DOTFILES
cp ~/.config/ghostty/ $DOTFILES 

cd ~/dotfiles/
git add --all
git commit
git push

