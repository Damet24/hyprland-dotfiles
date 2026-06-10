#!/bin/bash
cp -r ~/.config/hypr/ ~/dotfiles/config/
cp -r ~/.config/rofi/ ~/dotfiles/config/
cp ~/.config/starship.toml ~/dotfiles/config/

cd ~/dotfiles/
git add --all
git commit
git push

alias dots=~/dotfiles/scripts/dotfiles
