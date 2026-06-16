#!/bin/bash

cp -r ~/.config/hypr/ ~/dotfiles/config/
cp -r ~/.config/rofi/ ~/dotfiles/config/
cp -r ~/.config/kitty/ ~/dotfiles/config/
cp ~/.config/starship.toml ~/dotfiles/config/
cp ~/.zshrc ~/dotfiles/config/
cp -r ~/.config/ghostty/ ~/dotfiles/config/ 
cp -r ~/scripts/ ~/dotfiles/

cd ~/dotfiles/
git add --all
git commit
git push

