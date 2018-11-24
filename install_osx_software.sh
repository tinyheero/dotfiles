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

# List of brew packages to install
brew_packages=(
    htop
    rename
    md5sha1sum
    wget
    neovim
    gnu-sed
    pandoc
    cairo
)

if [[ "${is_brew_available}" -eq 0 ]]; then

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

    for brew_package in "${brew_packages[@]}"; do
        brew install "${brew_package}";
    done

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
