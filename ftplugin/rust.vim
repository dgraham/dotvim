compiler cargo

noremap <buffer> <leader>rf :RustFmt<cr>
let g:rustfmt_autosave = 0
let g:rustfmt_options = "--skip-children"

let g:racer_experimental_completer = 1
