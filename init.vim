source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

let g:rooter_manual_only = 1

"----------
" Autocommands
" Run certain commands whenever certain events happen. For example:
"
" :autocmd BufNewFile * :write
"        ^          ^ ^
"        |          | |
"        |          | The command to run.
"        |          |
"        |          A 'pattern to filter the event.
"        |
"        The 'event' to watch for.
"----------

" Automatically equalize splits when Vim is resized
autocmd VimResized * wincmd =

" Set number of spaces for tabs for different file types
autocmd Filetype snakemake,sh,pandoc setlocal tabstop=4 softtabstop=4 shiftwidth=4

" Autocommand group for r and rmd file types
augroup r_autocmd_grp
  " Syntax Highlighting for Rprofile Files
  autocmd BufNewFile,BufRead *.Rprofile set filetype=r

  " Allow for html omnicompletion to take place outside of R chunks and R
  " omnicompletion to take place inside of R chunks
  " https://groups.google.com/forum/#!msg/vim-r-plugin/KCxsqbj-hn4/1or-EG_1DQAJ
  " Following autocmd works when using nvim-r plugin
  autocmd FileType rmd let b:rplugin_nonr_omnifunc="htmlcomplete#CompleteTags" | setlocal omnifunc=CompleteR

augroup END

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
"
" Syntax Highlighting for Snakemake Files
" Requires syntax highlight definition file. See link below for more details.
" https://snakemake.readthedocs.io/en/stable/project_info/faq.html#how-do-i-enable-syntax-highlighting-in-vim-for-snakefiles

" Set filetype to be snakemake so that we can use vcmdline to launch a 
" corresponding python terminal
autocmd BufNewFile,BufRead Snakefile,*.smk set filetype=snakemake syntax=snakemake 

" Syntax highlighting for *.config files
autocmd BufNewFile,BufRead *.config set filetype=config
autocmd BufNewFile,BufRead nextflow.config set filetype=nextflow

" Set folding for .py files
autocmd BufNewFile,BufRead *.py set foldmethod=indent

"----------
" Airline Plugin
"----------

" Enable the list of buffers at the top (in the tabline)
let g:airline#extensions#tabline#enabled = 1

" Do not show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 0

" Show just the filename and not path of file in buffer
let g:airline#extensions#tabline#fnamemod = ':t'

" Populate the g:airline_symbols dictionary with the proper font glyphs for
" various symbols
let g:airline_powerline_fonts = 1

"----------
" NERDTree Plugin
"----------

" Prevents NERDTree plugin from using fancy arrow graphics
let g:NERDTreeDirArrows=0

" Map <Leader>nt key for turning on NERDTree
nnoremap <Leader>nt :NERDTree<CR>

" Prevents NERDTree plugin from using fancy arrow graphics
let g:NERDTreeDirArrows=0

" Show line numbers in NERDtree
let NERDTreeShowLineNumbers=1

"---------
" ack.vim
"---------

" Use ag in the background for the ack.vim plugin
"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif
"
"" Prevent Ack from jumping to first result
"cnoreabbrev Ack Ack!
"
"" Hotkey for activating Ack
"nnoremap <Leader>a :Ack!<Space>

" Function to figure out the git root directory
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" ProjectFiles command lists all the files starting from the git root directory
command! ProjectFiles execute 'Files' s:find_git_root()

"---------
" Tmux Powerline
"---------

" Remove the funny symbols in tmuxline
let g:tmuxline_powerline_separators = 1

"
" vim-pandoc-syntax
"

" Clashes with the <localleader>gf mapping I already have
" let g:pandoc#modules#disabled = ['hypertext', 'formatting']
"
" " Turn off spelling
" let g:pandoc#spell#enabled = 0
"
"
" " Hard-line wrapping once the textwidth is met in pandoc documents
" " There is the option to add autoformat (a) or smart autoformatting (A), but I
" " have found these to be troublesome
" let g:pandoc#formatting#mode = 'h'
"
" let g:pandoc#formatting#textwidth = 79
"
"
" " Mappings from the following submodules are enabled. Unlike the default, the
" " checklist module is disabled (it contains the <localleader>cd mapping that
" " clashes with Nvim-R. See :help vim-pandoc-keyboard-module for more details. 
"let g:pandoc#keyboard#enabled_submodules = ['lists', 'references', 'styles', 'sections', 'links']

"
" vim-json
"

" Prevent concealing of quotes, etc
let g:vim_json_syntax_conceal = 0

"
" ale
"

" Toggle linting on/off
map <leader>at :ALEToggle<CR>

"
" vimtex
"
"

" Needed to get over the https://github.com/lervag/vimtex/issues/223 issue
let g:tex_flavor = 'latex'

let g:indent_guides_enable_on_vim_startup = 1


let r_syntax_folding = 1

"
" Vim plugin config files
"
source $HOME/.config/nvim/plug-config/ale.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/nvim-r.vim
source $HOME/.config/nvim/plug-config/tagbar.vim
source $HOME/.config/nvim/plug-config/vimcmdline.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/vim-pandoc.vim
source $HOME/.config/nvim/plug-config/vim-pydocstring.vim
