# dotfiles

Repository to store my various .dotfiles. The `bash_profile` are set to be OS specific. The `all_bash_profile` provides a generic `bash_profile` to be used for Linux or Mac OSX. This is then loaded by the specific OS `bash_profile` files (e.g. `osx_bash_profile` and `linux_bash_profile`).

## How to Install

You need to first get homebrew:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once this is setup, install wget:

```
brew install wget
```

Now let's clone the repository:

```bash
git clone git@github.com:tinyheero/dotfiles.git
cd dotfiles
sh install.sh
```

## Neovim

The neovim configuration file requires neovim version > 0.1.4. 

> If you wish to use vim and not neovim, see below.

You can install neovim through homebrew (OSX): 

```{bash}
brew install neovim/neovim/neovim
```

If you are installing this on a linux distribution, then you can use [linuxbrew](http://linuxbrew.sh/). 

It also depends on several plugins managed through [vim-plug](https://github.com/junegunn/vim-plug). You need to first setup vim-plug:

```{bash}
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then install all the plugins by opening neovim and then:

```
:PlugInstall
```

The [vim-airline plugin](https://github.com/vim-airline/vim-airline) uses the powerline fonts. A patched font, based on what your terminal uses, is required for this which you can generate yourself or download a [pre-patched font](https://github.com/powerline/fonts). For example, in iTerm the default font is Monaco. A patched font for Monaco for the OSX was already generated [here](https://gist.github.com/baopham/1838072#file-monaco-powerline-otf). You can download it in then `Font Book" -> File -> Add Fonts and choose the "Monaco for Powerline.otf".`. 

Then in iTerm2, set both the Regular font and the Non-ASCII Font in "iTerm > Preferences > Profiles > Text" to use a patched font. Now restart your iTerm2 and it should now have the powerline symbols!

### Neovim and iTerm2 on OSX

There is this weird issue with iTerm2 on OSX where the command `ctrl-h` doesn't work to switch to the left pane. See this [thread](https://github.com/neovim/neovim/issues/2048) for details. The solution is the following inside of iTerm2:

1. Edit -> Preferences -> Keys
1. Press `+`
1. Press `Ctrl+h` as Keyboard Shortcut
1. Choose Send Escape Sequence as Action
1. Type `[104;5u` for Esc

### Nvim-R

One amazing plugin is the Nvim-R (formerly known as Vim-R-Plugin) which allows for the integration of vim and R. This isn't installed automatically through the above setup since we want to use the stable release. 

These instructions and the `nvim.init` file has been tested with Nvim-R v0.9.3. You can download this [here](http://www.vim.org/scripts/script.php?script_id=2628) and then get the `Nvim-R.vmb` open it and then:

```
:packadd vimball
:so %
```

Make sure you press the spacebar a few times to make sure everything gets installed. 

The plugin depends on an R package called `nvimcom` (formally known as vimcom). In the past, you would have to download the version that matched specifically with the plugin version you needed. But now, the plugin comes bundled with this package and will automatically install it for you to the R you have in your PATH. Additionally, you don't need to put `library("nvimcom")` in your `~/.Rprofile` because "Nvim-R sets the value of the environment variable R_DEFAULT_PACKAGES, including nvimcom."

If you ever need to install the nvimcom R package again (e.g. if you a different R instance), you can find it at `~/.config/nvim/R/nvimcom`. You can install this with:

```r
devtools::install("~/.config/nvim/R/nvimcom")
```

#### Nvim-R and Tmux

Nvim-R now contains its own terminal emulator which means it doesn't need tmux anymore. The `nvim.vim` configuration file is setup to still run tmux as external terminal emulator with the following lines:

```
let R_in_buffer = 0
let R_tmux_split = 1
```

This means you need to first start tmux and then launch vim. When you spawn an R session from inside vim, it will create another tmux session that is split in the same window. You can remove the `let R_tmux_split = 1` part if you want it to be external.

### Unite

To get the [Unite](https://github.com/Shougo/unite.vim) plugin working, you will need to also compile the [vimproc plugin](https://github.com/Shougo/vimproc.vim). This is automatically downloaded when you run `:PluginInstall`. So one needs to:

```bash
cd ~/.vim/bundle/vimproc.vim
make
```

Additionally, Unite is setup to use the [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) for searching for files (esssentially replaces [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)). You'll need to install the_silver_searcher:

On Mac OSX:

```bash
brew install the_silver_searcher
```

On Centos:

```bash
yum install the_silver_searcher
```

### ag.vim

The [ag.vim plugin](https://github.com/rking/ag.vim) serves as a front for the the_silver_searcher. This is essentially grep for programmers. A cool tip I learned from the video [07 - Plugins - The power of :Ag](https://www.youtube.com/watch?v=XzN4h4dj4cE) is using Ag to search and replace for a given string across all the files in your project.

```
:args `ag -l string_to_replace .`
:argdo %s/string_to_search/replacement_string/g | w
```

> ag.vim is different from Unite (listed above). Both use the_silver_searcher as a backend.

## Vim

If you don't want to use neovim, then you can also just use base vim. You can use all the plugins that are listed above. To set this up,

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then open vim, and run:

```
:PlugInstall
```

## Bash

### hstr

The `bash_profile` uses [hstr](https://github.com/dvorka/hstr). This can be used on Centos:

```
sudo yum install hstr -y
```

On Mac OSX, we can install using homebrew:

```
brew install hh
```

Alternatively, you can install from source.

## Base16

We use the Base16 color guideslines for vim, shell and the iterm2 terminal.

* [base16-vim](https://github.com/chriskempson/base16-vim)
* [base16-iterm2](https://github.com/chriskempson/base16-iterm2)
* [base16-shell](https://github.com/chriskempson/base16-shell)

In order to get everything working, you must install all 3 base16 color implementations.

### Base16-vim

This is automatically installed when you run `:PlugInstall` inside vim.

### Base16-iterm2

To install the base16-iterm2, simply go to the [github page](https://github.com/chriskempson/base16-iterm2) download the appropriate color scheme you need. In this case, this would be `base16-default.dark.256.itermcolors`. Then in iterm2:

1. Go to `Preferences > Profiles > Colors` 
2. Click on Color Presets... (bottom right) > Import and import your the `base16-default.dark.256.itermcolors` file.

### Base16-shell

The base16-shell implementation can be installed using:

```
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

Inside the `bash_profile` file, there is a line:

```bash
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-dark.sh"
[[ "$-" == *i* ]] && [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
```

This simply ensures that the correct bash16-shell color theme is loaded. In this case, we want it to the base16-default-dark.

## R

The `Rprofile` file configures what should be loaded in R when R is first started. One of the packages that is automatically loaded is the [colorout](https://github.com/jalvesaq/colorout) package. This is unfortunately not available from CRAN and would need to be installed manually. Using devtools also works:

```r
devtools::install_github("jalvesaq/colorout")
```
