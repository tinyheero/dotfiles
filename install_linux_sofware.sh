#!/bin/bash
#
# Install software for Linux
# This is called from the `install.sh` script
#

#----------
# fzf
#----------
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install \
	--key-bindings \
	--completion \
	--no-update-rc
