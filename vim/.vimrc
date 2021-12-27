syntax on
set expandtab shiftwidth=2 tabstop=2
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green

let mapleader=" "
set mouse=a
filetype indent on
set clipboard+=unnamed

map <LEADER>l <C-W>l
map <LEADER>k <C-W>k
map <LEADER>j <C-W>j
map <LEADER>h <C-W>h
map <LEADER>- <C-W>_
map <LEADER>= <C-W>\|
map <LEADER>M <C-W>\|<C-W>_
map <LEADER>m <C-W>=

map J 4j
map K 4k
vmap J <Nop>
vmap K <Nop>
map U <C-r>

noremap <LEADER><CR> :nohlsearch<CR>

