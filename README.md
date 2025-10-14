# Pre-requisites

## Mac OSX

First install homebrew

Install GNU tools

```bash
brew install coreutils findutils)
```

This gives you access to the GNU version of basic Linux tools, which can be 
accessed with a `g` prefix. For instance, `gln` gives you gives to the GNU 
version of `ln`.

# Installation

Install Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then run:

```bash
./install.sh
```

This will do the following:

1. Install zsh plugins
1. Install NvChad
