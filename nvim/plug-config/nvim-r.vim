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

" R console always opens horizontally
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

" Prevent cursor from jumping to the line being debugged (when `browser()` is 
" run). Highlighting of the line being debugged will also be disabled.
let R_debug = 0
