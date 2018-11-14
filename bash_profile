# vim: filetype=sh
#
# On Linux OS, .bash_profile is executed for login shells (e.g. remote login via
# ssh). While .bashrc is executed for interactive non-login shells (e.g. when 
# you already on the machine and opening a new bash instance).

# By having .bash_profile simply sources the .bashrc file. This allows us to 
# consolidate our configuration into one file. In other words, .bashrc will
# be executed regardless of login or non-login shells.
#
# See https://apple.stackexchange.com/questions/51036/what-is-the-difference-between-bash-profile-and-bashrc
# for more details.
if [[ -f ${HOME}/.bashrc ]]; then
    source "${HOME}/.bashrc";
fi
