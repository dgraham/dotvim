noremap <buffer> <leader>b :make<cr>
noremap <buffer> <leader>i :GoImports<cr>
noremap <buffer> <leader>l :GoLint<cr>
noremap <buffer> <leader>r :GoRun<cr>
noremap <buffer> <leader>t :GoTest<cr>

setlocal noexpandtab
setlocal shiftwidth=8
setlocal softtabstop=8
setlocal tabstop=8

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
