" vim: set ft=vim:
" Stops vim from behaving in a strongly vi -compatible way.
" Place at the start of vimrc file as it can affect lots of other
" options which you may want to override
set nocompatible

call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter' " Shows git diff in the gutter (sign column)
Plug 'bling/vim-bufferline' " show the list of buffers in the command bar
Plug 'chriskempson/base16-vim' " Base16 color scheme
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux and vim panes
Plug 'garbas/vim-snipmate' " TextMate's snippets features in Vim
Plug 'kshenoy/vim-signature' " Place, toggle and display marks
Plug 'Lokaltog/vim-easymotion' " Quick movements
Plug 'MarcWeber/vim-addon-mw-utils' " Dependency of vim-snipmate
Plug 'scrooloose/nerdtree' " File structure viewer
Plug 'Shougo/unite.vim' " Unite and create user interfaces
Plug 'Shougo/vimproc.vim' " Interactive command execution in Vim
Plug 'tinyheero/vim-snippets' " Snippets for vim-snipmate
Plug 'tomtom/tlib_vim' " Dependency of vim-snipmate
Plug 'tomtom/tcomment_vim' " Universal comment
Plug 'tpope/vim-fugitive' " Git integration
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' " Quoting and parenthesizing made simple
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline

call plug#end()

filetype plugin indent on

syntax on

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

" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Swap ; and : 		
" Avoid using <SHIFT> for Ex commands		
" Only applies in 'normal' mode
nnoremap ; :
nnoremap : ;

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
" http://jeffkreeftmeijer.com/2013/vims-new-hybrid-line-number-mode/
set relativenumber
set number

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

"" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Command to substitute all occurrences of the word under the cursor
nnoremap <leader>s :s/\<<C-r><C-w>\>/
nnoremap <leader>%s :%s/\<<C-r><C-w>\>/

" Move Up One Directory
map <leader>cd ;cd ..

"----------
" Autocommands
"----------

" Set number of spaces for tabs
autocmd Filetype r setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype rmd setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype python setlocal expandtab ts=4 sts=4 sw=4

" Allow for html omnicompletion to take place outside of R chunks and R
" omnicompletion to take place inside of R chunks
" https://groups.google.com/forum/#!msg/vim-r-plugin/KCxsqbj-hn4/1or-EG_1DQAJ
" Following autocmd works when using nvim-r plugin
"autocmd FileType rmd let b:rplugin_nonr_omnifunc="htmlcomplete#CompleteTags" | setlocal omnifunc=CompleteR

" Syntax Highlighting for Snakemake Files
" Requires syntax highlight definition file. See link below for more details.
" https://bitbucket.org/snakemake/snakemake/wiki/FAQ#markdown-header-how-do-i-enable-syntax-highlighting-in-vim-for-snakefiles
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

"----------
" Airline Plugin
"----------

" Enable the list of buffers and corresponding numbers
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 0

" Populate the g:airline_symbols dictionary with the proper font glyphs for
" various symbols
let g:airline_powerline_fonts = 1

"----------
" NERDTree Plugin
"----------

" Prevents NERDTree plugin from using fancy arrow graphics
let g:NERDTreeDirArrows=0

" Map <leader>nt key for turning on NERDTree
map <leader>nt ;NERDTree<ENTER>

" Prevents NERDTree plugin from using fancy arrow graphics
let g:NERDTreeDirArrows=0

" Show line numbers in NERDtree
let NERDTreeShowLineNumbers=1

"----------
" Unite Plugin
"----------
"
let g:unite_source_rec_async_command=['ag', '--nocolor', '--nogroup', '--ignore', '.hg', '--ignore', '.svn', '--ignore', '.git', '--ignore', '.bzr', '--hidden', '-g', '']

" Search files and open in vsplit
nnoremap <leader>fv :<C-u>Unite -buffer-name=files -default-action=vsplit -start-insert file_rec/async:!<cr>

" Search files and open in new tab
nnoremap <leader>ft :<C-u>Unite -buffer-name=files -default-action=tabopen -start-insert file_rec/async:!<cr>

" Search files and open in new window
nnoremap <leader>fc :<C-u>Unite -buffer-name=files -start-insert file_rec/async:!<cr>

nnoremap <space>/ :Unite grep:.<cr>

nnoremap <leader>b :<C-u>Unite -buffer-name=buffer buffer<cr>

" Use ag in unite grep source.
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '-i --vimgrep --hidden --ignore ' .
\ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

"---------
" Tmux Powerline
"---------

" Remove the funny symbols in tmuxline
let g:tmuxline_powerline_separators = 1

"----------
" Nvim-R : Plugin to work with R
" Formerly known as Vim-R-Plugin
"----------

" R help appears in horizontal window
let R_nvimpager = "horizontal"

" Run R inside tmux session
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1

" Highlight chunk header as R code
let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk = 1

"----------
" vim-visual-page-percent
"----------
let g:airline_section_z = airline#section#create(['windowswap', '%{VisualPercent()}', 'linenr', ':%3v '])
set laststatus=2
