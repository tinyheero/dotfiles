#!/usr/bin/env sh
#
# Install software for the Mac OSX
# This is called from the `install.sh` script
#
brew install \
	wget \
	neovim/neovim/neovim \
	hh \
	htop \ # Fancy top command
	rename \ # for renaming files
	md5sha1sum # For md5sum command
	grip # Preview README.md (or other md) using Github md (https://github.com/joeyespo/grip)

# For ssh hostname completion
# https://apple.stackexchange.com/a/209269
brew install bash-completion
brew tap homebrew/completions
