" Turn off pretty highlighting.
let g:pandoc#syntax#conceal#use = 0

" Highlight the codeblocks for these languages
let g:pandoc#syntax#codeblocks#embeds#langs = [
  \ 'bash=sh', 'python', 'r', 'make', 'snakemake'
\ ]
