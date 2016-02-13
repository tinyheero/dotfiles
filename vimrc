"----------
" Manage Plugins using Vundle
"----------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
Plugin 'airblade/vim-gitgutter' " Shows git diff in the gutter (sign column)
Plugin 'bling/vim-bufferline' " show the list of buffers in the command bar
Plugin 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux and vim panes
Plugin 'chriskempson/base16-vim' " Base16 color scheme
Plugin 'edkolev/tmuxline.vim'  " Improves the tmux status bar and integrates with the vim-airline
Plugin 'jalvesaq/R-Vim-runtime' " Development versions of R related runtime files
Plugin 'jeetsukumaran/vim-buffergator'  " List, select and switch between buffers.
Plugin 'kien/ctrlp.vim' " Fuzzy search
Plugin 'kshenoy/vim-signature' " Place, toggle and display marks
Plugin 'Lokaltog/vim-easymotion' " Quick movements
Plugin 'scrooloose/nerdtree' " File structure viewer
Plugin 'scrooloose/nerdcommenter' " Commenting
Plugin 'Raimondi/delimitMate' " Easy completion
Plugin 'tpope/vim-fugitive'  " Git integration
Plugin 'tpope/vim-surround'  " Quoting and parenthesizing made simple
Plugin 'vim-airline/vim-airline' " Status bar
Plugin 'vim-airline/vim-airline-themes' " Themes for vim-airline

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
filetype on " required!

"----------
" General
"----------

syntax enable

" Ensures that vim moves up/down linewise instead of by wrapped lines
nmap j gj
nmap k gk

" Turns plugin on depending on filetype
filetype plugin on	

" Special identation for certain filetypes
filetype indent on	

" Highlight searches
set hlsearch

" Incremental searching
set incsearch

" Ignore case while searching
set ignorecase

" Enables backspace. Seems to have been disabled in vim7.3.
set bs=2

" Set map leader to allow for extra key combinations
let mapleader = ","
let g:mapleader = ","

" Turn off ability to enter Ex mode which is not very useful to be in
nnoremap Q <nop>

" Set to auto read when a file is changed from the outside
set autoread	

" Turn off error beep/flash
set visualbell t_vb= 

"----------
" User Interface
"----------

" Black background
set background=dark

" Use base16 colors
let base16colorspace=256
colorscheme base16-default

" Always show current position
set ruler

" Always show status line
set ls=2            

" Put numbers on side
set number            

" Hotkey for toggling paste mode
set pastetoggle=<F2>

" Show matching brackets when text indicator is over them
set showmatch

" Turn on omni completion 
set omnifunc=syntaxcomplete#Complete

" Turns on nice popup menu for omni completion
:highlight Pmenu ctermbg=238 gui=bold

"----------
" Text, tab and indent related
"----------

" 1 tab == 2 spaces
" Number of spaces to use for autoindenting"
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab

" Auto indent
set ai

" Smart indent
set si

"----------
" Mappings
"----------

" Command to substitute all occurrences of the word under the cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

"----------
" Autocommands
"----------

" Rmarkdown tabs are 2 spaces
autocmd Filetype rmd setlocal expandtab ts=2 sts=2 sw=2

"----------
" Airline Plugin
"----------

" Enable the list of buffers and corresponding numbers
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 0

"----------
" NERDTree Plugin
"----------

" Map <leader>nt key for turning on NERDTree 
map <leader>nt :NERDTree<ENTER>

" Prevents NERDTree plugin from using fancy arrow graphics
let g:NERDTreeDirArrows=0

" Show line numbers in NERDtree
let NERDTreeShowLineNumbers=1

"----------
" CtrlP Plugin
"----------

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

"---------
" Tmux Powerline
"---------

" Remove the funny symbols in tmuxline
let g:tmuxline_powerline_separators = 0

"----------
" Vim-R-Plugin
"----------

" R help appears in horizontal window
let vimrplugin_vimpager = "horizontal"

"----------
" Buffergator Plugin
"----------

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap bj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap bk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>
