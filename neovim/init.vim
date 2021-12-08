let mapleader=" "
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set cindent
set ai
set mouse=a
set number
set hlsearch
set ruler
set laststatus=1
set clipboard+=unnamed
highlight Comment ctermfg=green

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
