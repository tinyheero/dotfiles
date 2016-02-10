"----------
" General
"----------

" Ensures that vim moves up/down linewise instead of by wrapped lines
nmap j gj
nmap k gk

" turns plugin on depending on filetype
filetype plugin on	

" special identation for certain filetypes
filetype indent on	

"----------
" Mappings
"----------

" Command to substitute all occurrences of the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"----------
" Autocommands
"----------
autocmd Filetype rmd setlocal expandtab ts=2 sts=2 sw=2

"----------
" Airline Plugin
"----------

" Enable the list of buffers and corresponding numbers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

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
Plugin 'bling/vim-airline' " status bar
Plugin 'christoomey/vim-tmux-navigator' " seamless navigation between tmux and vim panes
Plugin 'kien/ctrlp.vim' " fuzzy search
Plugin 'jalvesaq/R-Vim-runtime' " development versions of R related runtime files
Plugin 'jeetsukumaran/vim-buffergator'  " list, select and switch between buffers.
Plugin 'kshenoy/vim-signature' " place, toggle and display marks
Plugin 'Lokaltog/vim-easymotion' " quick movements
Plugin 'scrooloose/nerdtree' " file structure viewer
Plugin 'tpope/vim-fugitive'  " Git integration

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
