compiler eslint

noremap <buffer> <leader>l  :make % <cr>:cwindow<cr>:redraw!<cr>
noremap <buffer> <leader>lf :make --fix % <cr>:cwindow<cr>:redraw!<cr>
noremap <buffer> <leader>t :FlowType<cr>

let g:flow#autoclose = 1

let g:prettier#exec_cmd_async = 1
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'none'
