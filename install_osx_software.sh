#!/bin/bash
#
# Install software for the Mac OSX
# This is called from the `install.sh` script
#
brew install wget 
bew install neovim 

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

#----------
# fzf
#----------
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install \
	--key-binding \
	--completion

#----------
# Pygments
#----------

# Used for syntax highlighting
conda install -y Pygments
