let mapleader=" "
let g:python_recommended_style = 0
syntax on
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set mouse=a
set number
set hlsearch
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
