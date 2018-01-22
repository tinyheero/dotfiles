# dotfiles

Repository to store my various .dotfiles. The `bash_profile` are set to be OS specific. The `all_bash_profile` provides a generic `bash_profile` to be used for Linux or Mac OSX. This is then loaded by the specific OS `bash_profile` files (e.g. `osx_bash_profile` and `linux_bash_profile`).

**Table of Contents**

* [How to Install](#how-to-install)
* [Neovim](#neovim)
    + [Neovim and iTerm2 on OSX](#neovim-and-iterm2-on-osx)
    + [Nvim-R](#nvim-r)
        - [Nvim-R and Tmux](#nvim-r-and-tmux)
    + [ack.vim](#ack.vim)
* [Vim](#vim)
* [Bash](#bash)
    + [hstr](#hstr)
* [Base16](#base16)
    + [Base16-vim](#base16-vim)
    + [Base16-iTerm2](#base16-iterm2)
    + [Base16-shell](#base16-shell)
* [R](#r)
* [Tmux](#tmux)
* [git](#git)
* [htop](#htop)
* [iTerm2](#iterm2)
    + [Italics in iTerm2](#italics-in-iterm2)
    + [Open iTerm2 tab here](#open-iterm2-tab-here)
* [Docker](#docker)
* [Batch rename files using vim](#batch-rename-files-using-vim)
* [Preview markdown files](#preview-markdown-files)

## How to Install

You need to first get homebrew:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once this is setup, install wget:

```
brew install wget
```

Also, we need to get [miniconda](https://conda.io/miniconda.html). 

Once before homebrew and conda are installed, we can clone this repository:

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

The [vim-airline plugin](https://github.com/vim-airline/vim-airline) uses the powerline fonts. A patched font, based on what your terminal uses, is required for this which you can generate yourself or download a [pre-patched font](https://github.com/powerline/fonts). For example, in iTerm the default font is Monaco. A patched font for Monaco for the OSX was already generated [here](https://gist.github.com/baopham/1838072#file-monaco-powerline-otf). You can download it in then on your Mac go to `"Font Book" -> File -> Add Fonts and choose the "Monaco for Powerline.otf".`. 

Then in iTerm2, set both the Regular font and the Non-ASCII Font in "iTerm2 > Preferences > Profiles > Text" to use the patched font (e.g Monaco for Powerline). Now restart your iTerm2 and it should now have the powerline symbols!

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

### ack.vim

The [ack.vim plugin](https://github.com/mileszs/ack.vim) serves as a front for the [the_silver_searcher](https://github.com/ggreer/the_silver_searcher). Confusingly, the [ag.vim](https://github.com/rking/ag.vim) plugin, which was orginally designed to be the front for the_silver_searcher has been deprecated (see this [comment](https://github.com/rking/ag.vim/issues/124#issuecomment-227038003) for more details). 

This is essentially grep for programmers allowing for quick searching across your files. A cool tip I learned from the video [07 - Plugins - The power of :Ag](https://www.youtube.com/watch?v=XzN4h4dj4cE) is using Ag to search and replace for a given string across all the files in your project.

```
:args `ag -l string_to_replace .`
:argdo %s/string_to_search/replacement_string/g | w
```

To get this to work, you need [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) for searching for files. You can install on Mac OSX:

```bash
brew install the_silver_searcher
```

On Centos:

```bash
yum install the_silver_searcher
```


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

On Mac OSX, this is replaced with the fzf.

## Base16

We use the Base16 color guideslines for vim, shell and the iterm2 terminal.

* [base16-vim](https://github.com/chriskempson/base16-vim)
* [base16-iterm2](https://github.com/chriskempson/base16-iterm2)
* [base16-shell](https://github.com/chriskempson/base16-shell)

In order to get everything working, you must install all 3 base16 color implementations.

### Base16-vim

This is automatically installed when you run `:PlugInstall` inside vim.

### Base16-iTerm2

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

### Starting a new R project

For starting a new R project, you can use the `setup_r_proj.R` script:

```r
~/dotfiles/setup_r_proj.R
```

This will automatically install the following R packages:

* nvimcom
* colorout

## Tmux

The `tmux.conf` is setup such that the prefix is switched from `<C-b>` to `<C-a>`. This is so that it is concordant with the default binding used in screen, which what I switched from. It is also setup to allow for copying from inside a tmux session using vi commands. By installing `reattach-to-user-namespace`:

```
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
```

The text will be copied into the system clipboard. You may or may not need to also select "Applications in terminal may access clipboard" inside iTerm2 -> Preferences (see this link for more details). This may only be with mouse copying though. The workflow for this is as follows:

```
C-a escape # to enter copy mode
v # visual selection
q # to escape copy mode
```

Then you can copy using `command-p` as per usual as the text is copied into the OS clipboard.

## Git

Autocompletion of git commands and branches is setup. See this [article](http://code-worrier.com/blog/autocomplete-git/) for more details.

## htop

Htop is a nicer version of top. You can get it by running:

```
brew install htop
```

## iTerm2

### Italics in iTerm2

To get italics in iTerm2, follow these [instructions](https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/).

### Open iTerm2 tab here

Sometimes you need to open the current folder in iTerm2 to do some quick linux commands. On OSX, one can use the automator and applescript for this. See this [snippet of code](https://gist.github.com/ttimasdf/7bb02ed419db4b472b534e1a57008a3b) for more details.

## Docker

To get tab completion for Docker commands, see this [link](https://blog.alexellis.io/docker-mac-bash-completion/). 

## Batch rename files using vim

https://github.com/thameera/vimv

## Preview markdown files

To preview your markdown files, you can use [Grip (GitHub Readme Instant Preview)](https://github.com/joeyespo/grip) 
for this. You can install this using homebrew:

```
brew install grip
```

Then you can run:

```
grip -b README.md 
```

This will automatically preview the README file in a new browser tab. 

> Keep in mind this previews using Github markdown specification.
