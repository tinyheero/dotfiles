#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup symlink
ln -sfv "$DOTFILES_DIR/vimrc" ~/.vimrc
ln -sfv "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf
ln -sfv "$DOTFILES_DIR/inputrc" ~/.inputrc

# Setup snakemake Syntax Highlighting
wget https://bitbucket.org/snakemake/snakemake/raw/master/misc/vim/syntax/snakemake.vim -O ~/.vim/syntax/snakemake.vim
