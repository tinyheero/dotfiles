#!/bin/bash
#
# Install script to setup my configuration. This will detect which operating
# system (OS) you are on and perform OS specific installations.
#
# Author: Fong Chun Chan

export DOTFILES_DIR DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

brew_update_flag="$1"
if [[ -z "${brew_update_flag}" ]]; then
    brew_update_flag="no";
fi


#
# Setup symlinks from home directory to the dotfiles folder.
#

# bash_profile and bashrc symlinks are created below
symlink_files=(
    vimrc
    tmux.conf
    inputrc
    Rprofile
    ctags.d
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

# Setup NvChad configuration only if Neovim is available
if command -v nvim >/dev/null; then
    git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
else
    echo "Did not find nvim. Skipping plugin manager (vim-plug) installation"
fi

# Get git autocomplete
bash_completion_dir="${DOTFILES_DIR}/.bash_completion.d";
[[ -d "${bash_completion_dir}" ]] || mkdir -p "${bash_completion_dir}";
curl \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    -o "${bash_completion_dir}/git-completion.bash";

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

# Enables vimcmdline to work with Snakefile files
# NOTE: You have to do a copy. If you do a symbolic link, you won't be able to
# launch vimcmdline. It will complain `Unknown function: VimCmdLineSetApp`
rsync \
        "${DOTFILES_DIR}/vimcmdline/ftplugin/snakemake_cmdline.vim" \
        "${HOME}/.local/share/nvim/lazy/vimcmdline/ftplugin/snakemake_cmdline.vim"
