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
nnoremap <LEADER>l <C-W>l
nnoremap <LEADER>k <C-W>k
nnoremap <LEADER>j <C-W>j
nnoremap <LEADER>h <C-W>h 

nnoremap tt :tabnew<CR>
nnoremap tl :tabn<CR>
nnoremap th :tabp<CR>

nnoremap go <C-o>
nnoremap gp <C-i>
nnoremap gk [m
nnoremap gj ]m

call plug#begin()

Plug 'preservim/nerdtree' 
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

"===========
"=========== neredtree
"===========
nnoremap <leader>p :NERDTreeFocus<CR>
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='<ENTER>'

"===========
"=========== vim-fzf
"===========
nnoremap gf :Files<CR>
let g:fzf_action = {'enter': 'tab split'}

"===========
"=========== markdown-preview
"===========
let g:mkdp_browser = '/Applications/Safari.app'
