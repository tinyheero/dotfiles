source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

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

  autocmd Syntax r,rmd normal zR

  " Allow for html omnicompletion to take place outside of R chunks and R
  " omnicompletion to take place inside of R chunks
  " https://groups.google.com/forum/#!msg/vim-r-plugin/KCxsqbj-hn4/1or-EG_1DQAJ
  " Following autocmd works when using nvim-r plugin
  autocmd FileType rmd let b:rplugin_nonr_omnifunc="htmlcomplete#CompleteTags" | setlocal omnifunc=CompleteR
augroup END

" Syntax Highlighting for Snakemake Files
" Requires syntax highlight definition file. See link below for more details.
" https://snakemake.readthedocs.io/en/stable/project_info/faq.html#how-do-i-enable-syntax-highlighting-in-vim-for-snakefiles

" Set filetype to be snakemake so that we can use vcmdline to launch a 
" corresponding python terminal
autocmd BufNewFile,BufRead Snakefile set filetype=snakemake syntax=snakemake 
autocmd BufNewFile,BufRead *.smk set filetype=snakemake syntax=snakemake 

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

"----------
" Nvim-R
" Formerly known as Vim-R-Plugin
"----------

" Don't display a preview window of function descriptions and usage when using
" omni completion.
let R_show_args = 0

" Emulate Tmux ^az (zoom window feature)
" Pressing gz will open the current buffer in a new tab to get it occupying the
" whole screen.
function ZoomWindow()
    let cpos = getpos(".")
    tabnew %
    redraw
    call cursor(cpos[1], cpos[2])
    normal! zz
endfunction
nmap gz :call ZoomWindow()<CR>

" R help appears in horizontal window
let R_nvimpager = "horizontal"

" Highlight chunk header as R code
let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk = 1

" zathura is the recommend pdf viewer for Nvim-R, but requires very recent
" version that is unavailable as a binary from package manager
" Setting it to evince is a workaround.
let R_pdfviewer = "evince"

" R panel always opens horizontally
let R_rconsole_width = 0

" Underscore will be replaced with the assign operator only if it is preceded
" by a space and followed by a non-word character
" :help R_assign
let R_assign = 3

" Normally, Nvim-R will set to the same directory as the opened R file. This
" prevents Nvim-R from setting the R working directory in any way. Useful
" when your own ~/.Rprofile is setting a working directory.
let R_nvim_wd = -1

" Setup to get indenting to follow the tidyverse style
" See this link https://stackoverflow.com/questions/13597256/change-r-indentation-style-in-vim-with-vim-r-plugin
" for details on how this works...
let r_indent_align_args = 0
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

"---------
" ack.vim
"---------

" Use ag in the background for the ack.vim plugin
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Prevent Ack from jumping to first result
cnoreabbrev Ack Ack!

" Hotkey for activating Ack
nnoremap <Leader>a :Ack!<Space>

"
" fzf
"

" Function to figure out the git root directory
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" ProjectFiles command lists all the files starting from the git root directory
command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>pf :ProjectFiles<CR>
nnoremap <Leader>t :Tags<CR>

"---------
" Tmux Powerline
"---------

" Remove the funny symbols in tmuxline
let g:tmuxline_powerline_separators = 1

"----------
" Ctags
"----------
" Ctag Support for R
" https://github.com/majutsushi/tagbar/wiki#r
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

" Turns on the TagBar
nnoremap <Leader>tb :TagbarToggle<CR>

"set tags=./tags,tags;

"----------
" vimcmdline
"----------
let cmdline_map_start= '<LocalLeader>rf'
let cmdline_map_send= '<LocalLeader>d'

let cmdline_app = {}
let cmdline_app['sh'] = 'bash'

if executable('ipython')
  " Using ipython allows you to circumvent the 'indentation pasting' issues.
  let cmdline_app['python'] = 'ipython'
else
  let cmdline_app['python'] = 'python'
endif

"----------
" Use lintr on .R files (using ale)
"----------

" Turn off some linters
" https://github.com/w0rp/ale/issues/1508
let g:ale_r_lintr_options = 'lintr::with_defaults(object_name_linter = NULL, line_length_linter(80), object_length_linter(40))'

"
" vimrooter
"

" Turn off the automatic directory changing behavior and instead use `:Rooter`
" when you want to change directories
"let g:rooter_manual_only = 1

"
" vim-pandoc and vim-pandoc-syntax
"

" Clashes with the <localleader>gf mapping I already have
let g:pandoc#modules#disabled = ["hypertext", "formatting"]

" Turn off spelling
let g:pandoc#spell#enabled = 0

" Turn off pretty highlighting.
let g:pandoc#syntax#conceal#use = 0

" Hard-line wrapping once the textwidth is met in pandoc documents
" There is the option to add autoformat (a) or smart autoformatting (A), but I
" have found these to be troublesome
let g:pandoc#formatting#mode = 'h'

let g:pandoc#formatting#textwidth = 79

" Highlight the codeblocks for these languages
let g:pandoc#syntax#codeblocks#embeds#langs = ["bash=sh", "python", "r", "make", "snakemake"]

" Mappings from the following submodules are enabled. Unlike the default, the
" checklist module is disabled (it contains the <localleader>cd mapping that
" clashes with Nvim-R. See :help vim-pandoc-keyboard-module for more details. 
let g:pandoc#keyboard#enabled_submodules = ["lists", "references", "styles", "sections", "links"]

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

nmap <localleader>d <Plug>(iron-send-line)
vmap <localleader>se <Plug>(iron-visual-send)

"
" Vim plugin config files
"
source ${HOME}/.config/nvim/plug-config/coc.vim
source ${HOME}/.config/nvim/plug-config/iron.vim
luafile ${HOME}/.config/nvim/plugins.lua
