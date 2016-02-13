# dotfiles

Repository to store my various .dotfiles. 

## How to Install

```bash
git clone git@github.com:tinyheero/dotfiles.git
cd dotfiles
sh install.sh
```

### Vim

The vim configuration file `vimrc` depends on several plugins managed through Vundle. To install them, open vim and then:

```
:PluginInstall
```

The [vim-airline plugin](https://github.com/vim-airline/vim-airline) uses the powerline fonts. A patched font, based on what your terminal uses, is required for this which you can generate yourself or download a [pre-patched font](https://github.com/powerline/fonts). For example, in iTerm the default font is Monaco. A patched font for Monaco for the OSX was already generated [here](https://gist.github.com/baopham/1838072#file-monaco-powerline-otf). You can download it in then `Font Book" -> File -> Add Fonts and choose the "Monaco for Powerline.otf".`. Restart your iTerm2 and it should now have the powerline symbols!
