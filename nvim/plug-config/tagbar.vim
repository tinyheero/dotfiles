" Turns on the TagBar
nnoremap <Leader>tb :TagbarToggle<CR>

let g:tagbar_type_snakemake = {
  \ 'ctagstype': 'snakemake',
  \ 'kinds': ['r:rules', 'f:functions'],
  \ 'sort': 0
\ }

let g:tagbar_type_rmd = {
\   'ctagstype':'rmd'
\ , 'kinds':['h:header', 'c:chunk', 'f:function', 'v:variable']
\ , 'sro':'&&&'
\ , 'kind2scope':{'h':'header', 'c':'chunk'}
\ , 'sort':0
\ , 'ctagsbin': "$HOME/dotfiles/get-rmd-tags/get-rmd-tags.py"
\ , 'ctagsargs': ''
\ }

let g:tagbar_type_r = {
    \ 'ctagsbin'  : 'ctags',
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'c: Class',
        \ 'f: Fields',
        \ 'm: Method',
        \ 'g: GlobalVariables',
        \ 'v: FunctionVariables',
    \ ]
\ }
