syntax on
set expandtab shiftwidth=2 tabstop=2
set ai
set number
set hlsearch
highlight Comment ctermfg=green
hi Pmenu                cterm=none ctermbg=8        ctermfg=15      gui=none        guibg=#8F8F8F   guifg=#F7F7F7

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeout
set ttimeoutlen=0
set ttyfast
set undofile
set undodir=~/.vim/undodir


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

nnoremap gu gU

nnoremap tt :tabnew<CR>
nnoremap tl :tabn<CR>
nnoremap th :tabp<CR>

nnoremap go <C-o>
nnoremap gp <C-i>
nnoremap gk [m
nnoremap gj ]m

call plug#begin()

Plug 'preservim/nerdtree' 
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

"===========
"=========== coc
"===========
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-html', 'coc-java', 'coc-pyright', 'coc-css', 'coc-css', 'coc-html-css-support', 'coc-tsserver', 'coc-eslint', 'coc-sh', 'coc-markdownlint', 'coc-snippets']
set updatetime=0
set signcolumn=yes

" Make <CR> or <tab> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm()
      \: "\<TAB>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

map <C-r> <Plug>(coc-rename)
map <C-o> :OR<CR>
map <LEADER>f :Format<CR>
inoremap <silent><expr> <C-]> coc#refresh()
nmap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
