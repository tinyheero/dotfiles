let g:ale_linters = {
\   "r": ["lintr"], 
\   "python": ["flake8"]
\}

let g:ale_fixers = {
\ "python": ["black"],
\}

" Turn off some linting rules for lintr
" https://github.com/w0rp/ale/issues/1508
let g:ale_r_lintr_options = 'lintr::with_defaults(object_name_linter = NULL, line_length_linter(80), object_length_linter(40))'
let g:ale_python_black_options = "--line-length 79"

" Run a fixer on save
let g:ale_fix_on_save = 1
