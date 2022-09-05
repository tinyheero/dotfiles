" Turns on the TagBar
nnoremap <Leader>tb :TagbarToggle<CR>

let g:tagbar_type_snakemake = {
  \ 'ctagstype': 'snakemake',
  \ 'kinds': ['r:rules', 'f:functions'],
  \ 'sort': 0
\ }
