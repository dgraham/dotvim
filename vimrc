set nocompatible          " vim defaults, not vi
call pathogen#infect()    " use pathogen to manage plugins
syntax on                 " syntax highlighting
filetype plugin on        " auto detect file types
filetype indent on        " auto indent lines

" macvim
if has('gui_running')
  set guioptions-=T       " remove toolbar
  set guioptions-=r       " remove right scrollbar
  set guioptions-=l       " remove left scrollbar
  set guioptions-=L       " remove nerdtree toolbar
  set gcr=a:blinkon0      " disable cursor blink

  " fonts
  set guifont=Menlo:h11
  " set guifont=Source\ Code\ Pro:h13
endif

" colors
colorscheme xcode-low-key

" disable welcome intro
set shortmess+=I

" whitespace
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" disable word wrap
set linebreak
set nolist
set nowrap
set textwidth=0
set wrapmargin=0

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" autocomplete
set completeopt=menu
set pumheight=10
set wildmode=list:longest

" allow unsaved buffers
set hidden

" never forget
set history=1000

" autosave buffers
set autoread
set autowriteall
autocmd FocusLost * silent! wall

" ignore binary files in filename completion
set wildignore+=*.a,*.bundle,*.dylib,*.o,*.gz,*.so,*.zip
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png

" no max file limit
let g:ctrlp_max_files = 0

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" speed holes
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" mute
set belloff=all

set laststatus=2 " status line
set ruler        " cursor location
set cursorline   " highlight current row
set number       " line numbers
set scrolloff=3  " lines shown above/below current line

" disable .swp files
set noswapfile

" .swp file directory
if has('mac') || has('unix')
  set backupdir=/tmp
  set directory=/tmp
endif

" leader for custom mappings
let mapleader=','

" repeat find in reverse
noremap \ ,

" navigate split windows
nnoremap <silent> <left>  <c-w>h
nnoremap <silent> <right> <c-w>l
nnoremap <silent> <up>    <c-w>k
nnoremap <silent> <down>  <c-w>j

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" edit and reload .vimrc
noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" ripgrep search
set grepprg=rg\ --vimgrep\ --type-add\ erb:*.erb
command! -nargs=+ -complete=file -bar Rg silent! grep! <args> | cwindow | redraw!
noremap <leader>f :Rg<space>

" search word under cursor
nnoremap <silent> K :silent! :grep! -w "<c-r><c-w>"<cr>:cwindow<cr>:redraw!<cr>

" visual shifting
vnoremap < <gv
vnoremap > >gv

" clear highlighted search
nmap <silent> <leader>/ :nohlsearch<cr>

" fugitive
noremap <leader>go :Gbrowse<cr>
noremap <leader>gs :Gstatus<cr>

" ctags
nnoremap <silent> <f5> :silent ! git ls-files \| ctags --tag-relative -L - -f `git rev-parse --git-dir`/tags --languages=ruby 2> /dev/null &<cr>:redraw!<cr>

" expand active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" nerdtree
map <leader>n :NERDTreeToggle<cr>
map <leader>m :NERDTreeFind<cr>
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeChDirMode=2

" filetypes
autocmd FileType c      setl expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType cpp    setl expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType make   setl noexpandtab shiftwidth=8 softtabstop=8 tabstop=8
autocmd FileType ruby   compiler ruby

" remove trailing whitespace on save
function! RemoveWhitespace()
  let view=winsaveview()
  exec ':%s/\s\+$//e'
  call winrestview(view)
endfunction
autocmd BufWritePre * :call RemoveWhitespace()

" local customizations
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
