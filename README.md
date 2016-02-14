# dotfiles

Repository to store my various .dotfiles. 

## How to Install

```bash
git clone git@github.com:tinyheero/dotfiles.git
cd dotfiles
sh install.sh
```

## Vim

The vim configuration file `vimrc` depends on several plugins managed through [Vundle](https://github.com/VundleVim/Vundle.vim). You need to first setup Vundle:

```
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
