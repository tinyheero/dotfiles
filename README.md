# dotfiles

Repository to store my various .dotfiles. 

## How to Install

```bash
git clone git@github.com:tinyheero/dotfiles.git
cd dotfiles
sh install.sh
```

## Vim

The vim configuration file `vimrc` requires vim version > 7.4 and with the clientserver feature enabled. You can install vim through homebrew:

```{bash}
brew install --with-client-server 
```

It also depends on several plugins managed through [Vundle](https://github.com/VundleVim/Vundle.vim). You need to first setup Vundle:

```{bash}
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Then install all the plugins by opening vim and then:

```
:PluginInstall
```

The [vim-airline plugin](https://github.com/vim-airline/vim-airline) uses the powerline fonts. A patched font, based on what your terminal uses, is required for this which you can generate yourself or download a [pre-patched font](https://github.com/powerline/fonts). For example, in iTerm the default font is Monaco. A patched font for Monaco for the OSX was already generated [here](https://gist.github.com/baopham/1838072#file-monaco-powerline-otf). You can download it in then `Font Book" -> File -> Add Fonts and choose the "Monaco for Powerline.otf".`. Restart your iTerm2 and it should now have the powerline symbols!

### Vim-R-Plugin

One amazing plugin is the Vim-R-Plugin which allows for the integration of vim and R. This isn't installed automatically through the above setup since we want to use the stable release. You can download this [here](http://www.vim.org/scripts/script.php?script_id=2628) and then get the `Vim-R-plugin.vmb` open it and then:

```
:source %
```

Make sure you press the spacebar a few times to make sure everything gets installed. 

> You will need the matching version of [vimcom R package](https://github.com/jalvesaq/VimCom) for the corresponding Vim-R-Plugin.

### Unite

To get the [Unite](https://github.com/Shougo/unite.vim) plugin working, you will need to also compile the [vimproc plugin](https://github.com/Shougo/vimproc.vim). This is automatically downloaded when you run `:PluginInstall`. So one needs to:

```bash
cd ~/.vim/bundle/vimproc.vim
make
```

Additionally, Unite is setup to use the [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) for searching for files (esssentially replaces [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)). You'll need to install the_silver_searcher:

```
brew install the_silver_searcher
```
