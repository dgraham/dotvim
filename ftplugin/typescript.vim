setlocal makeprg=npx\ --no-install\ --quiet\ tsc\ --pretty\ false\ $*
setlocal errorformat=%f(%l\\\,%c):\ %m

noremap <buffer> <leader>c :make <cr>:cwindow<cr>:redraw!<cr>
noremap <buffer> <leader>l :make % <cr>:cwindow<cr>:redraw!<cr>
