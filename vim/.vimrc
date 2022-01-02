syntax on
set expandtab shiftwidth=2 tabstop=2
set ai
set number
set hlsearch
highlight Comment ctermfg=green

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeout
set ttimeoutlen=0
set ttyfast

set mouse=a
filetype indent on
set clipboard+=unnamed
map U <C-R>
 
let mapleader=" "
noremap <LEADER><CR> :nohlsearch<CR>
map <LEADER>l <C-W>l
map <LEADER>k <C-W>k
map <LEADER>j <C-W>j
map <LEADER>h <C-W>h

map tt :tabnew<CR>
map tl :tabn<CR>
map th :tabp<CR>

call plug#begin()

Plug 'preservim/nerdtree' 
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

call plug#end()

"===========
"=========== neredtree
"===========
nnoremap <leader>p :NERDTreeFocus<CR>

"===========
"=========== vim-fzf
"===========
nnoremap <leader>f :Files<CR>

"===========
"=========== markdown-preview
"===========
let g:mkdp_browser = '/Applications/Safari.app'
