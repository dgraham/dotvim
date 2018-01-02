compiler cargo

noremap <buffer> <leader>p :RustFmt<cr>
noremap <buffer> <leader>b :make build<cr>
noremap <buffer> <leader>r :make run<cr>
noremap <buffer> <leader>t :make test<cr>

let g:rustfmt_autosave = 0
let g:rustfmt_options = "--skip-children"

let g:racer_experimental_completer = 1
