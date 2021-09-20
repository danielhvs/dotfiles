" comandinhos: 
" :scriptnames
let maplocalleader = "-"
let mapleader = ","
set termguicolors

" sao 2 arquivos diferentes!
" /home/danielhabib/.config/nvim/plugin/ReplaceWithRegister
call plug#begin('/home/danielhabib/.local/share/nvim/site/autoload')
Plug 'tpope/vim-surround' " ds'
Plug 'tpope/vim-commentary' " gc + motion
Plug 'tpope/vim-repeat' " melhora .
Plug 'tpope/vim-rhubarb' " git browse vim-fugitive
Plug 'tpope/vim-fugitive' " git
Plug 'sheerun/vim-polyglot'
Plug 'gruvbox-community/gruvbox/'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'mfussenegger/nvim-jdtls'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people' " depende do vim-sexp
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dmac/vim-cljfmt'
Plug 'christoomey/vim-sort-motion'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'itchyny/lightline.vim'
call plug#end()

" TODO clojure https://github.com/rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide

" plugin configs...

" gruvbox
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" buftabline
let g:buftabline_numbers    = 0
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
set background=dark
" fim plugin configs

" testando... 
set scrolloff=8
set hidden
" antes usava set hlsearch 
set nohlsearch
set lazyredraw
set splitright
set splitbelow

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set noswapfile
" Be smart when using tabs ;)
set smarttab
set expandtab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

" autocompletar melhor em command mode 
set wildmode=longest,list,full
set noerrorbells
set novisualbell
set incsearch 
set nonumber
set iskeyword+=-
set ignorecase
" When searching try to be smart about cases: se procurar com letra maiuscula considera smart!
set smartcase
set relativenumber
set nu

set path+=**
nnoremap ,alm :read ~/.gitmessage<cr>2j

" window
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" disable ex mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" removendo setas
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" custom leader commands
nmap <leader>d :bd!<cr>
map <leader>q :q!<cr>
nmap <leader>w :w!<cr>
map <leader>x :x<cr>
map <leader>c :set list<cr>
map <leader>C :set nolist<cr>
" usar ]b do vim-unimpaired
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" terminal
tnoremap <Esc> <C-\><C-n>

" formats comeca com f
nmap <leader>fjson :%!jq .<cr>
nmap <leader>fhtml :%!tidy --show-errors 0 -i -q 2>/dev/null<cr>

" sets comecam com <leader>s
map <leader>sh :set hlsearch!<cr>

" git 
map <leader>gc :vertical Git commit % -v<cr>
map <leader>gp :Git push<cr>
map <leader>gg :vertical Git<cr>
map <leader>gd :Gvdiffsplit<cr>:windo set wrap<cr>
map <leader>gf :diffget //2<cr>:diffupdate<cr>
map <leader>gh :diffget //3<cr>:diffupdate<cr>
map <leader>gl :0Gclog<cr>
map <leader>go :Git checkout %<cr>
map <leader>ga :Git add %<cr>
map <leader>gb :GBrowse<cr>:!i3-msg workspace number 2<cr>

nnoremap Y y$
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap J mzJ`z

" mover linhas
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
" autocompletar path
inoremap <C-space> <C-x><C-f>

" tim pope sensible plugin https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
set autoread
syntax enable

if has('autocmd')
  filetype plugin indent on
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
" fim tim pope sensible

" LSP nativo inicio
if has('nvim-0.5')
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
  augroup end
endif

" curl custom
command X set splitright | vnew | set filetype=sh | read !sh #

lua << EOF
  require'init'
EOF

" ctrlp config
nmap <leader>p :CtrlP<cr>
nmap <leader>o :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|eco-docs\|target\|log\'
let g:ctrlp_max_files=0 
let g:ctrlp_by_filename = 1

" java lsp
"  `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
"  use this mapping also with other language servers
nnoremap <leader>la <Cmd>lua require('jdtls').code_action()<CR>
vnoremap <leader>la <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
nnoremap <leader>lo <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR> 
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR> 
nnoremap <leader>ld <Cmd>lua vim.lsp.buf.declaration()<CR> 
nnoremap <leader>lt <cmd>lua vim.lsp.buf.type_definition()<CR> 
nnoremap <leader>lh <cmd>lua vim.lsp.buf.signature_help()<CR> 
nnoremap <leader>ln <cmd>lua vim.lsp.buf.rename()<CR> 
nnoremap <leader>le <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR> 
nnoremap <leader>lq <cmd>lua vim.lsp.diagnostic.set_loclist()<CR> 
nnoremap <leader>lf <cmd>lua vim.lsp.buf.formatting()<CR> 
nnoremap <leader>lj <cmd>lua vim.lsp.diagnostic.goto_next()<CR> 
nnoremap <leader>lk <cmd>lua vim.lsp.diagnostic.goto_prev()<CR> 
nnoremap <leader>lw :lua require('telescope.builtin').lsp_workspace_diagnostics()<cr> 
nnoremap <leader>lr :lua require('telescope.builtin').lsp_references()<cr> 
nnoremap <leader>li :lua require('telescope.builtin').lsp_implementations()<cr> 

" lighline plugin " colorscheme Tomorrow_Night
let g:lightline = {
      \ 'colorscheme': 'selenized_black', 
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }
set noshowmode
