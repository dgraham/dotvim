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
  set guifont=Menlo:h11   " font size
  set gcr=a:blinkon0      " disable cursor blink
  set background=light    " colors
  colorscheme base16-tomorrow
endif

" colors
hi Normal       guifg=#121212    guibg=#ffffff    gui=NONE    ctermfg=233    ctermbg=231    cterm=NONE
hi NonText      guifg=#ffffff    guibg=#ffffff    gui=NONE    ctermfg=231    ctermbg=231    cterm=NONE
hi LineNr       guifg=#e4e4e4    guibg=NONE       gui=NONE    ctermfg=254    ctermbg=NONE   cterm=NONE
hi CursorLine   guifg=NONE       guibg=NONE       gui=NONE    ctermfg=NONE   ctermbg=NONE   cterm=NONE
" hi Directory    guifg=#5f0087    guibg=NONE       gui=NONE    ctermfg=54     ctermbg=NONE   cterm=NONE
hi Search       guifg=NONE       guibg=#ffff00    gui=NONE    ctermfg=NONE   ctermbg=226    cterm=NONE
hi StatusLine   guifg=#080808    guibg=#eeeeee    gui=bold    ctermfg=232    ctermbg=255    cterm=bold
hi StatusLineNC guifg=#b2b2b2    guibg=#eeeeee    gui=NONE    ctermfg=249    ctermbg=255    cterm=NONE
hi VertSplit    guifg=#ffffff    guibg=#ffffff    gui=NONE    ctermfg=231    ctermbg=231    cterm=NONE
hi Visual       guifg=NONE       guibg=#afd7ff    gui=NONE    ctermfg=NONE   ctermbg=153    cterm=NONE
hi Pmenu        guifg=#ffffff    guibg=#262626    gui=NONE    ctermfg=231    ctermbg=235    cterm=NONE
hi PmenSbar     guifg=NONE       guibg=#444444    gui=NONE    ctermfg=NONE   ctermbg=238    cterm=NONE
hi PmenuSel     guifg=#ffffff    guibg=#afd7ff    gui=NONE    ctermfg=231    ctermbg=153    cterm=NONE
hi PmenuThumb   guifg=#000000    guibg=NONE       gui=NONE    ctermfg=black  ctermbg=NONE   cterm=NONE

" hi NERDTreeDir  guifg=#000000    guibg=NONE       gui=bold    ctermfg=black  ctermbg=NONE   cterm=bold
" hi NERDTreeCWD  guifg=#000000    guibg=NONE       gui=bold    ctermfg=black  ctermbg=NONE   cterm=bold

" syntax highlighting
hi Comment      guifg=#bcbcbc    guibg=NONE       gui=NONE    ctermfg=250    ctermbg=NONE   cterm=NONE
hi htmlLink     guifg=NONE       guibg=NONE       gui=NONE    ctermfg=NONE   ctermbg=NONE   cterm=NONE

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

" ignore vendored files in ctrlp
set wildignore+=*/vendor/cache/**
set wildignore+=*/vendor/bundle/**
set wildignore+=*/vendor/gems/**

" no max file limit
let g:ctrlp_max_files = 0

" mute
set visualbell
set noerrorbells

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

" arrows navigate splits
nnoremap <silent> <left>  <c-w>h
nnoremap <silent> <right> <c-w>l
nnoremap <silent> <up>    <c-w>k
nnoremap <silent> <down>  <c-w>j

" edit and reload .vimrc
noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" ack search
noremap <leader>f :Ack!<space>

" visual shifting
vnoremap < <gv
vnoremap > >gv

"clear highlighted search
nmap <silent> <leader>/ :nohlsearch<cr>

" nerdtree
map <leader>n :NERDTreeToggle<cr>
map <leader>m :NERDTreeFind<cr>
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeChDirMode=2

" filetypes
autocmd BufRead,BufNewFile *.json      set filetype=javascript
autocmd BufRead,BufNewFile *.thor      set filetype=ruby
autocmd BufRead,BufNewFile *.god       set filetype=ruby
autocmd BufRead,BufNewFile Gemfile*    set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

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
