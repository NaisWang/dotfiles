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
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lock'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

"===========
"=========== coc
"===========
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-html', 'coc-java', 'coc-pyright', 'coc-css', 'coc-css', 'coc-html-css-support', 'coc-tsserver', 'coc-eslint', 'coc-sh']
set updatetime=50
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

set signcolumn=yes

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `g[` and `g]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)

"===========
"=========== neredtree
"===========
nnoremap <leader>p :NERDTreeFocus<CR>

"===========
"=========== vim-fzf
"===========
nnoremap <leader>f :Files<CR>
