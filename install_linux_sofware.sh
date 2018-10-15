#!/bin/bash
#
# Install software for Linux
# This is called from the `install.sh` script
#

#
# fzf
#
#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#~/.fzf/install \
#	--key-bindings \
#	--completion \
#	--no-update-rc

#
# Install ack (programmer's grep)
# Used by ack.vim if Ag (the_silver_searcher) is not available.
#
usr_bin_dir="${HOME}/usr/bin/";

[[ -d "${HOME}/usr/bin/" ]] || mkdir -p "${usr_bin_dir}";

echo "Installing ack";
curl https://beyondgrep.com/ack-2.24-single-file \
    > "${usr_bin_dir}/ack" \
    && chmod 0755 "${usr_bin_dir}/ack";
