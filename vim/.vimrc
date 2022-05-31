syntax on
set expandtab shiftwidth=2 tabstop=2
set ai
set mouse=a
set number
set wildmenu

set hlsearch
set incsearch "边输入边搜索(实时搜索)

highlight Comment ctermfg=green
highlight SignColumn ctermbg=15 ctermfg=15 gui=none  guibg=#808080 guifg=#F7F7F7
highlight Pmenu ctermfg=NONE ctermbg=0 cterm=NONE guifg=NONE guibg=#64666d gui=bold

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
map U :redo<CR>

let mapleader=" "
noremap <LEADER><CR> :nohlsearch<CR>
nnoremap <LEADER>l <C-W>l
nnoremap <LEADER>k <C-W>k
nnoremap <LEADER>j <C-W>j
nnoremap <LEADER>h <C-W>h 

nnoremap tt :tabnew<CR>
nnoremap tl :tabn<CR>
nnoremap th :tabp<CR>

noremap J 4j
noremap K 4k
nnoremap gk [m
nnoremap gj ]m
nnoremap g, '.

call plug#begin()

Plug 'preservim/nerdtree' 
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'dhruvasagar/vim-table-mode'
Plug 'majutsushi/tagbar'

Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

call plug#end()

:autocmd BufRead *.md :Tagbar

"===========
"=========== coc
"===========
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-html', 'coc-java', 'coc-pyright', 'coc-css', 'coc-html-css-support', 'coc-tsserver', 'coc-eslint', 'coc-sh', 'coc-snippets', '@yaegassy/coc-volar', 'coc-clangd', 'coc-cmake', 'coc-xml']
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
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
command! -nargs=0 Format :call CocAction('format')

map <LEADER>f :Format<CR>
inoremap <silent><expr> <C-]> coc#refresh()
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <C-k> :call <SID>show_documentation()<CR>
inoremap <C-a> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>
nmap <C-f> <Plug>(coc-codeaction)
nmap <C-r> <Plug>(coc-rename)
nnoremap <silent> <C-M> :call CocAction('runCommand', 'editor.action.organizeImport')<CR>

"===========
"=========== neredtree
"===========
nnoremap <C-p> :NERDTreeFocus<CR>
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
"let g:mkdp_browser = '/Applications/Safari.app'

"===========
"=========== tagbar
"===========
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }

"===========
"=========== vim-markdown
"===========
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_list_item_indent = 2
let g:vim_markdown_conceal=0
