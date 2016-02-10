"----------
" General
"----------

" ensures that vim moves up/down linewise instead of by wrapped lines
nmap j gj
nmap k gk

"----------
" Autocommands
"----------
autocmd Filetype rmd setlocal expandtab ts=2 sts=2 sw=2

"----------
" Airline
"----------

 " Enable the list of buffers and corresponding numbers
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1

"----------
" Vundle Stuff
"----------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
Plugin 'scrooloose/nerdtree' " file structure viewer
Plugin 'kshenoy/vim-signature' " place, toggle and display marks
Plugin 'Lokaltog/vim-easymotion' " quick movements
Plugin 'christoomey/vim-tmux-navigator' " seamless navigation between tmux and vim panes
Plugin 'jalvesaq/R-Vim-runtime' " development versions of R related runtime files

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype on                   " required!
