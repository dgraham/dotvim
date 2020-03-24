compiler tsc
noremap <buffer> <leader>c  :compiler tsc <nl> :make <cr>:cwindow<cr>:redraw!<cr>
noremap <buffer> <leader>l  :compiler tsc <nl> :make --noEmit <cr>:cwindow<cr>:redraw!<cr>
noremap <buffer> <leader>el :compiler eslint <nl> :make % <cr>:cwindow<cr>:redraw!<cr>
noremap <buffer> <leader>lf :compiler eslint <nl> :make --fix % <cr>:cwindow<cr>:redraw!<cr>
