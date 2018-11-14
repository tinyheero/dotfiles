#!/bin/bash
#
# Author: Fong Chun Chan
#

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup symlinks
ln -sfv "${DOTFILES_DIR}/vimrc" ~/.vimrc
ln -sfv "${DOTFILES_DIR}/tmux.conf" ~/.tmux.conf
ln -sfv "${DOTFILES_DIR}/inputrc" ~/.inputrc
ln -sfv "${DOTFILES_DIR}/Rprofile" ~/.Rprofile
ln -sfv "${DOTFILES_DIR}/all_bashrc" ~/.all_bashrc
ln -sfv "${DOTFILES_DIR}/ctags" ~/.ctags
ln -sfv "${DOTFILES_DIR}/gitconfig" ~/.gitconfig
ln -sfv "${DOTFILES_DIR}/screenrc" ~/.screenrc

# Link a different ~/.bash_profile depending on OS
if [[ "${OSTYPE}" == "darwin"* ]]; then

	ln -sfv "${DOTFILES_DIR}/osx_bash_profile" ~/.bash_profile;
	./install_osx_software.sh;

elif [[ "${OSTYPE}" == "linux-gnu" ]]; then

	ln -sfv "${DOTFILES_DIR}/bash_profile" ~/.bash_profile;
	ln -sfv "${DOTFILES_DIR}/linux_bashrc" ~/.bashrc;
	./install_linux_sofware.sh;

fi

# Setup Neovim configuration only if Neoviom is available
if command -v nvim >/dev/null; then
	mkdir -p ~/.config/nvim
	ln -sfv "${DOTFILES_DIR}/nvim.init" ~/.config/nvim/init.vim

	# Plugin manager (vim-plugin) for neovim
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# Launch Neovim, install plugins, and then quit
	nvim +PlugInstall +qall
else
	echo "Did not find nvim. Skipping plugin manager (vim-plug) installation"
fi

# Setup snakemake Syntax Highlighting
wget \
	https://bitbucket.org/snakemake/snakemake/raw/master/misc/vim/syntax/snakemake.vim \
	-O ~/.vim/syntax/snakemake.vim

# Get git autocomplete
curl \
	https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
	-o ~/.git-completion.bash

# Install base-16 shell for colors
# Need to work with base16 colors for Vim/Neovim and iTerm2
git clone \
	https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Setup iTerm2 Shell integration
#./setup_iterm2_shell_integration.sh
