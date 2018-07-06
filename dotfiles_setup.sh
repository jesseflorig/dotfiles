#!/bin/bash
# Author: Jesse Florig
# Purpose: Create soft links in home directory for dotfiles

DOTFILES=(".zshrc" ".vimrc" ".tmux.conf")
REPO="${HOME}/Repos/dotfiles"

for dotfile in "$DOTFILES[@]";do
  ln -sf "${HOME}/${dotfile}" "${REPO}"
done
