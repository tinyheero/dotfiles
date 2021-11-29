" Easy vim window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Seamlessly navigate Vim splits and tmux panes
" https://bluz71.github.io/2017/06/14/a-few-vim-tmux-mappings.html
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" Command to substitute all occurrences of the word under the cursor
nnoremap <Leader>s :s/\<<C-r><C-w>\>/
nnoremap <Leader>%s :%s/\<<C-r><C-w>\>/

" Move Up One Directory
nnoremap <Leader>cd :cd ..

" This moves the matches for your search to the center of the screen when you
" press n or N so it is easier to identify where you are in your document.
" https://vimrcfu.com/snippet/175
nnoremap n nzz
nnoremap N Nzz

" Move visual block
"
" Rebinds J and K in visual mode to move block up or down in relation to the
" other lines, while keeping the selection.
"
" This version also re-indents the line to match indentation rules in its new
" position. (if you don't like that, remove the 'gv=' in the middle :D)
"
" https://vimrcfu.com/snippet/77
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Typing Y yanks from cursor to the end of the line
" https://vimrcfu.com/snippet/88
nnoremap Y y$

" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Set j,k movements from strict linewise to onscreen display line movements.
" If movement preceeded by a number, useful in relative number mode, then
" revert back to strict linewise movements.
"
" Additionally, it will save movements larger than 5 lines to the jumplist.
" Use ctrl-o/ctrl-i to navigate backwards and forwards through this jumplist.
"
" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Interacting with system clipboard
" https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/
" NOTE: Using `set clipboard+=unnamedplus` makes block paste ineffective.

" Copy to clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+yg_
nnoremap <Leader>y "+y
nnoremap <Leader>yy "+yy

" Paste from clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Turn off ability to enter Ex mode which is not very useful to be in
" <nop> means no operation
nnoremap Q <nop>

" Use arrow keys to resize windows
" https://vimrcfu.com/snippet/94
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" Hotkeys for vertical (vs) and horizontal split (hs)
nnoremap <Leader>vs :vsplit
nnoremap <Leader>hs :split

" Hotkey for turning off highlighted searches
nnoremap <Leader><space> :nohls <enter>

" Edit your vimrc file in a vertical split
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" Source your vimrc file
" Combined with <Leader>ev will allow you to edit
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Hotkey for turning on lintr for R scripts
nnoremap <Leader>lr :ALEToggle<CR>

" Hotkey for trimming trailing white space (i.e. at the end of the line)
nnoremap <Leader>tws :%s/\s\+$//e

" Hotkey to forward slashes (/) into (", "). This is useful for converting 
" file paths like /path/to/file to ("path", "to", "file"). 
nnoremap <Leader>cp :s/\//", "/g<CR>
