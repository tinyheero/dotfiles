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

Assuming your default shell is bash and you are in this dotfiles folder.

First install Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Setup your `~/.zshrc`:

```bash
ln -rs zshrc ~/.zshrc

# On Mac OSX
gln -rs zshrc ~/.zshrc
```

Change your default shell to Zsh. Then restart your terminal session.

Once you log back in, `cd` back into this `dotfiles` folder and run:

```bash
export ZSH_CUSTOM
./install.sh
```

**Note: ZSH_CUSTOM is defined by the `~/.zshrc` script. When we run 
`install.sh`, it is run as a non-login non-interactive shell. So `~/.zshrc` 
will not get sourced. To overcome this, we explicitly `EXPORT` this 
environment variable so that it is available to the `install.sh` script.**

This will do the following:

1. Setup aliases
1. Install zsh plugins
1. Install NvChad
