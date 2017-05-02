#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup symlink
ln -sfv "$DOTFILES_DIR/vimrc" ~/.vimrc
ln -sfv "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf
ln -sfv "$DOTFILES_DIR/inputrc" ~/.inputrc
ln -sfv "$DOTFILES_DIR/Rprofile" ~/.Rprofile
ln -sfv "$DOTFILES_DIR/all_bash_profile" ~/.all_bash_profile

if [[ "$OSTYPE" == "darwin"* ]]; then
	ln -sfv "$DOTFILES_DIR/osx_bash_profile" ~/.bash_profile
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
	ln -sfv "$DOTFILES_DIR/linux_bash_profile" ~/.bash_profile
fi

mkdir -p ~/.config/nvim
ln -sfv "$DOTFILES_DIR/nvim.init" ~/.config/nvim/init.vim

# Setup snakemake Syntax Highlighting
wget https://bitbucket.org/snakemake/snakemake/raw/master/misc/vim/syntax/snakemake.vim -O ~/.vim/syntax/snakemake.vim
