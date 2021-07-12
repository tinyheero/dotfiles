" Specify a directory for plugins to be installed to
call plug#begin('~/.config/nvim/plugged')

  " Shows git diff in the gutter (sign column)
  Plug 'airblade/vim-gitgutter'

  " Changes Vim working directory to project root (identified by presence of 
  " known directory or file).
  Plug 'airblade/vim-rooter'

  " Base16 color scheme
  Plug 'chriskempson/base16-vim'

  " Seamless navigation between tmux splits and vim panes.
  Plug 'christoomey/vim-tmux-navigator'

  " Instant table creation
  Plug 'dhruvasagar/vim-table-mode'

  "Plug 'elzr/vim-json' " A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
  "Plug 'garbas/vim-snipmate' " TextMate's snippets features in Vim
  Plug 'jalvesaq/Nvim-R', { 'tag': 'v0.9.13' } " Vim plugin to work with R. Last release that works with neovim < 0.3.4
  "Plug 'jalvesaq/vimcmdline' " Send code to command line interpreter
  
  " Place, toggle and display marks
  Plug 'kshenoy/vim-signature'

  " Support for writing latex documents
  Plug 'lervag/vimtex'

  " Quick movements
  Plug 'Lokaltog/vim-easymotion'
  Plug 'LukeGoodsell/nextflow-vim' " Vim plugin for Nextflow workflows
  "Plug 'MarcWeber/vim-addon-mw-utils' " Dependency of vim-snipmate
  Plug 'majutsushi/tagbar' " Displays tags in a window, ordered by scope
  Plug 'mileszs/ack.vim' " Searching tool
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of completion
  Plug 'scrooloose/nerdtree' " File structure viewer
  "Plug 'sheerun/vim-polyglot' " Syntax highlighting for python and other languages
  Plug 'rhysd/committia.vim' " More pleasant editing on git commit message
  "Plug 'tinyheero/vim-myhelp' " Personal vim-cheatsheet
  "Plug 'tinyheero/vim-snippets' " Snippets for vim-snipmate
  "Plug 'tomtom/tlib_vim' " Dependency of vim-snipmate
  Plug 'tomtom/tcomment_vim' " Universal comment
  Plug 'tpope/vim-fugitive' " Git integration
  Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
  Plug 'tpope/vim-surround' " Quoting and parenthesizing made simple
  Plug 'unblevable/quick-scope' " Lightning fast left-right movement in Vim
  "Plug 'Vimjas/vim-python-pep8-indent' " Modify vim’s indentation behavior to comply with PEP8 and author's aesthetic preferences
  Plug 'vim-airline/vim-airline' " Status bar
  Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'Yggdroot/indentLine' " Display the indention levels with thin vertical lines
  Plug 'w0rp/ale' " Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
  Plug 'hkupty/iron.nvim'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim' " fzf vim plugin

" Initialize plugin system
call plug#end()
