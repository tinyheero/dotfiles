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

  " Generate Python docstring to your Python source code.
  Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

  " Vim plugin to work with R. 
  Plug 'jalvesaq/Nvim-R'

  " Requires for quarto syntax highlighting
  Plug 'jalvesaq/R-Vim-runtime'

  " Send code to command-line interpreter (REPL application)
  Plug 'jalvesaq/vimcmdline' 
  
  " Place, toggle and display marks
  Plug 'kshenoy/vim-signature'

  " Support for writing latex documents
  Plug 'lervag/vimtex'

  " File system explorer
  Plug 'preservim/nerdtree'

  " Browse the tags of the current file and get an overview of its structure
  Plug 'preservim/tagbar' 

  " Quick movements
  Plug 'Lokaltog/vim-easymotion'
  Plug 'LukeGoodsell/nextflow-vim' " Vim plugin for Nextflow workflows
  Plug 'mileszs/ack.vim' " Searching tool
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of completion
  Plug 'rhysd/committia.vim' " More pleasant editing on git commit message
  Plug 'tomtom/tcomment_vim' " Universal comment
  Plug 'tpope/vim-fugitive' " Git integration
  Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
  Plug 'tpope/vim-surround' " Quoting and parenthesizing made simple
  Plug 'unblevable/quick-scope' " Lightning fast left-right movement in Vim
  Plug 'vim-airline/vim-airline' " Status bar
  Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
  "Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'w0rp/ale' " Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
  "Plug 'preservim/vim-markdown'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim' " fzf vim plugin


" Initialize plugin system
call plug#end()
