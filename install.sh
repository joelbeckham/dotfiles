#!/bin/sh

cd /mnt/c/dotfiles/home
export dotFileDir="$PWD"

for file in .[^.]*; do
  ln -sf $dotFileDir/$file ~/$file;
done
