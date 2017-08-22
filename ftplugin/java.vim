compiler javac

noremap <buffer> <silent> <leader>c :silent! :make % -Xlint:unchecked<cr>:cwindow<cr>:redraw!<cr>
noremap <buffer> <leader>r :!java -cp . %:r<cr>

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
