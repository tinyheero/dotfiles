#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup symlink
ln -sfv "$DOTFILES_DIR/vimrc" ~/.vimrc
