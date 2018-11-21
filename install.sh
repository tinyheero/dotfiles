#!/bin/bash
#
# Author: Fong Chun Chan
#

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#
# Setup symlinks
#

symlink_files=(
    vimrc
    tmux.conf
    inputrc
    Rprofile
    ctags
    gitconfig
    screenrc
    bash_completion
    bash_completion.d
)

for symlink_file in "${symlink_files[@]}"; do
    ln -sfv "${DOTFILES_DIR}/${symlink_file}" ~/.${symlink_file};
done

#
# Bash configurations
# .bash_profile simply sources the .bashrc, which in turns sources the 
# .all_bashrc (.bashrc that is shared across OS)
#

ln -sfv "${DOTFILES_DIR}/bash_profile" ~/.bash_profile;

# Link a different ~/.bashrc depending on OS
if [[ "${OSTYPE}" == "darwin"* ]]; then
	ln -sfv "${DOTFILES_DIR}/osx_bashrc" ~/.bashrc;
	./install_osx_software.sh;
elif [[ "${OSTYPE}" == "linux-gnu" ]]; then
	ln -sfv "${DOTFILES_DIR}/linux_bashrc" ~/.bashrc;
	./install_linux_sofware.sh;
fi

ln -sfv "${DOTFILES_DIR}/all_bashrc" ~/.all_bashrc

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
