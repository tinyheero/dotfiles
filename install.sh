#!/bin/bash
#
# Install script to setup my configuration. This will detect which operating
# system (OS) you are on and perform OS specific installations.
#
# Author: Fong Chun Chan

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

brew_update_flag="$1"
if [[ -z "${brew_update_flag}" ]]; then
    brew_update_flag="no";
fi

#
# Directories to make
# These will house specific files that are created below.
#
directories_to_make=(~/.vim/syntax)

for directory_to_make in "${directories_to_make[@]}"; do
    [[ -d "${directory_to_make}" ]] || mkdir -p "${directory_to_make}";
done

#
# Setup symlinks from home directory to the dotfiles folder.
#

# bash_profile and bashrc symlinks are created below
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
    ln -sfv "${DOTFILES_DIR}/${symlink_file}" "${HOME}/.${symlink_file}";
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
    ./install_osx_software.sh "${brew_update_flag}";
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
# Use ~/.vim/syntax for regular Vim
wget \
    https://bitbucket.org/snakemake/snakemake/raw/master/misc/vim/syntax/snakemake.vim \
    -O ~/.config/syntax/snakemake.vim

# Get git autocomplete
curl \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    -o "${DOTFILES_DIR}/.bash_completion.d/git-completion.bash";

# Install base-16 shell for colors
# Need to work with base16 colors for Vim/Neovim and iTerm2
if [[ ! -d ~/.config/base16-shell ]]; then
    git clone \
        https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
else
    cd ~/.config/base16-shell || exit;
    git pull;
    cd ..;
fi

# Setup iTerm2 Shell integration
#./setup_iterm2_shell_integration.sh
