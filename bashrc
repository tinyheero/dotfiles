# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
 . /etc/bashrc
fi

umask 002

# Needed to fix <c-h> binding for neovim
export TERMINFO="$HOME/.terminfo"

#----------
# Linuxbrew
#----------
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

#---------
# User interface
#---------

# Base16 shell colors
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ "$-" == *i* ]] && [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Customize linux prompt
export PS1="\u@\h [\t] \w >> "

#----------
# User specific aliases
#----------

# Line numbers and tabs width = 2 space
alias less="less -N -x 2"

alias rsync="rsync -avr --partial --progress --rsh=ssh"
alias ls="ls -F"
alias pd="pushd"
alias bd="popd"
alias make="make --warn-undefined-variables"
alias vi="nvim"

#----------
# Nvim-R (formally known as Vim-R-Plugin)
#----------

# Change the TERM environment variable (to get 256 colors) even if you are
# accessing your system through ssh and using either Tmux or GNU Screen:
if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
       export TERM=xterm-256color
       export HAS_256_COLORS=yes
fi

if [ "$TERM" = "screen" ] && [ "$HAS_256_COLORS" = "yes" ]
then
 	 export TERM=screen-256color
fi

#----------
# Functions
#----------

# Extract function
function extract(){
  if [ -f $1 ] ; then
    case $1 in
        *.tar.bz2)   tar xvjf $1     ;;
        *.tar.gz)    tar xvzf $1     ;;
        *.bz2)       bunzip2 $1      ;;
        *.rar)       unrar x $1      ;;
        *.gz)        gunzip $1       ;;
        *.tar)       tar xvf $1      ;;
        *.tbz2)      tar xvjf $1     ;;
        *.tgz)       tar xvzf $1     ;;
        *.zip)       unzip $1        ;;
        *.Z)         uncompress $1   ;;
        *.7z)        7z x $1         ;;
        *.xz)        xz -d $1         ;;
        *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Autocomplete for Conda
# http://conda.pydata.org/docs/install/tab-completion.html
eval "$(register-python-argcomplete conda)"
