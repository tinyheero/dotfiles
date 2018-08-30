#!/bin/bash
#
# Install software for the Mac OSX
# This is called from the `install.sh` script
#
# Contributors: Fong Chun Chan

# Exit on uncaught error, disallow unset variables
# set -o pipefail raise an error if any command in a pipe fails
set -euo pipefail;

#
# Installation using Homebrew
#

# Check that Homebrew is installed
is_brew_available=$(command -v brew > /dev/null);
if [[ "${is_brew_available}" -eq 0 ]]; then
    brew install wget
    brew install neovim

    # Fancy top command
    brew install htop

    # For renaming files
    brew install rename

    # For md5sum command
    brew install md5sha1sum

    # Preview README.md (or other md) using Github md
    # (https://github.com/joeyespo/grip)
    brew install grip 
    
    # For ssh hostname completion
    # https://apple.stackexchange.com/a/209269
    brew install bash-completion
    
    # A code-searching tool similar to ack, but faster
    brew install the_silver_searcher
    
    # Install universal ctags
    brew install ctags
    
    # Tmux
    brew install tmux 
    
    # Allow for copying from inside a tmux session using vim commands
    brew install reattach-to-user-namespace
    
    # fzf
    brew install fzf

    # To install useful key bindings and fuzzy completion
    # Do not allow for modification of your .bashrc file since this is already 
    # included in the repository
    "$(brew --prefix)"/opt/fzf/install \
        --key-bindings \
        --completion \
        --no-update-rc

    # bash linter
    brew install shellcheck

else 
    echo "Please install Homebrew first. See https://brew.sh"; 
    exit 1;
fi

#
# Installation using conda
#

# Check that Miniconda3 is installed
if [[ -e ${HOME}/miniconda3 ]]; then
    # Used for syntax highlighting
    conda install -y Pygments
    
    # conda tab complete
    conda install argcomplete
else 
    echo "Please install Miniconda3 first. See https://conda.io/miniconda.html";
    exit 1;
fi
