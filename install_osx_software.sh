#!/bin/bash
#
# Install software for the Mac OSX
# This is called from the `install.sh` script
#

# Homebrew needs to be installed first
which brew > /dev/null;
if [[ $? -neq 0 ]]; then
	echo "Please install homebrew first. See https://brew.sh"; 
	exit 1
fi

# Miniconda3 needs to be installed first
if [[ ! -e ${HOME}/miniconda3 ]]; then
	echo "Please install Miniconda3 first. See https://conda.io/miniconda.html";
	exit 1;
fi

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

#----------
# Tmux
#----------

brew install tmux 

# Allow for copying from inside a tmux session using vim commands
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste

#----------
# fzf
#----------
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install \
	--key-bindings \
	--completion

# Used for syntax highlighting
conda install -y Pygments

# conda tab complete
conda install argcomplete
