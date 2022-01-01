syntax on
set expandtab shiftwidth=2 tabstop=2
set ai
set number
set hlsearch
highlight Comment ctermfg=green

set mouse=a
filetype indent on
set clipboard+=unnamed
map U <C-R>

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeout
set ttimeoutlen=0
set ttyfast
 
let mapleader=" "
noremap <LEADER><CR> :nohlsearch<CR>
map <LEADER>l <C-W>l
map <LEADER>k <C-W>k
map <LEADER>j <C-W>j
map <LEADER>h <C-W>h
