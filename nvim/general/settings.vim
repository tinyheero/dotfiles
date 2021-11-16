"----------
" General
"----------
syntax on

" Turns plugin on depending on filetype
filetype plugin on

" Special identation for certain filetypes
filetype indent on

" Highlight searches
set hlsearch

" Search characters as they are entered
set incsearch

" Ignore case while searching
set ignorecase

" Set <Leader> and <LocalLeader> to allow for extra key combinations
let g:mapleader = ","
let g:maplocalleader = "\\"

" Set to auto read when a file is changed from the outside
set autoread

" Turn off error beep/flash
set visualbell t_vb=

" Better wrapping with breakindent
" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
set breakindent
set showbreak=\\\\\

" Number of lines from the bottom when scrolling
set scrolloff=7

setlocal nowrap


"----------
" User Interface
"----------

" Black background
set background=dark

" Use base16 colors
let base16colorspace=256
colorscheme base16-default-dark

" Always show current position
set ruler

" Always show status line
set ls=2

" Use hybrid line number mode
" Current line is listed as absolute line number while lines above and below
" are listed relative to it.
" http://jeffkreeftmeijer.com/2013/vims-new-hybrid-line-number-mode/
set number relativenumber

" Hotkey for toggling paste mode
set pastetoggle=<F2>

" Show matching brackets when text indicator is over them
set showmatch

" Turn on omni completion
set omnifunc=syntaxcomplete#Complete

" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif

" Turns on nice popup menu for omni completion
:highlight Pmenu ctermbg=238 gui=bold

" Highlight current line
set cursorline

" Set length of each time to be a maximum of 79 characters
set textwidth=79

" Highlight column at textwidth + 1 as visual guide
set colorcolumn=+1


"----------
" Text, tab and indent related
"----------

" Converts tabs into spaces 
set shiftwidth=2 " Determines how many spaces a reindent operation counts for
set tabstop=2 " Determines how many spaces a tab counts for
set softtabstop=2

" Insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab

" Auto indent
" Applies the indentation of the current line to the next
set autoindent

" Smart indent
" Reacts to the syntax/style of the code you are editing
set smartindent

" Convert new tabs into spaces. If you need tabs for a particular file time,
" then you should use autocommands to set a local buffer
set expandtab
