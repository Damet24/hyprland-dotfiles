#!/bin/bash
cp -r ~/.config/hypr/ ~/dotfiles/

cd ~/dotfiles/
git add --all
git commit
git push

alias dots=~/dotfiles/scripts/dotfiles
