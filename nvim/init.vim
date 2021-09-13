" comandinhos: 
" :scriptnames
let maplocalleader = "-"
let mapleader = ","
set termguicolors

" sao 2 arquivos diferentes!
" /home/danielhabib/.config/nvim/plugin/ReplaceWithRegister
call plug#begin('/home/danielhabib/.local/share/nvim/site/autoload')
Plug 'christoomey/vim-system-copy' " cp+motion or cv+motion (cV) (cP)
Plug 'tpope/vim-surround' " ds'
Plug 'tpope/vim-commentary' " gc + motion
Plug 'tpope/vim-repeat' " melhora .
Plug 'tpope/vim-fugitive' " git
Plug 'sheerun/vim-polyglot'
Plug 'gruvbox-community/gruvbox/'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'mfussenegger/nvim-jdtls'
" Plug 'hrsh7th/nvim-cmp'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people' " depende do vim-sexp
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dmac/vim-cljfmt'
Plug 'junegunn/gv.vim'
Plug 'christoomey/vim-sort-motion'
call plug#end()

" TODO clojure https://github.com/rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide

" plugin configs...

" coc
" source $HOME/.config/nvim/plug-config/coc.vim

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
set guicursor=
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

" removendo setas
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" custom leader commands
nmap <leader>json :%!jq .<cr>
nmap <leader>html :%!tidy --show-errors 0 -i -q 2>/dev/null<cr>
nmap <leader>d :bd!<cr>
map <leader>q :q!<cr>
nmap <leader>w :w!<cr>
map <leader>x :x<cr>
map <leader>wq :wq!<cr>
map <leader>c :set list<cr>
map <leader>C :set nolist<cr>
nmap <leader>- :bNext<cr>
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" terminal
tnoremap <Esc> <C-\><C-n>

" git 
map <leader>gc :vertical Git commit % -v<cr>
map <leader>gp :Git push<cr>
map <leader>gg :vertical Git<cr>
map <leader>gf :diffget //2<cr>:diffupdate<cr>
map <leader>gh :diffget //3<cr>:diffupdate<cr>
map <leader>gl :0Gclog<cr>
map <leader>gco :Git checkout %<cr>
map <leader>ga :Git add %<cr>

set showmatch
" copia tudo para ctrl v
nmap <leader>Y mkggcpG'k

" manter centralizado
" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap J mzJ`z
" nnoremap # #zzzv
" nnoremap * *zzzv
nnoremap Y y$
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" mover linhas
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" daniel autocmds
" tira whitespaces
nnoremap <leader><space> :%s/\s\+$//e<cr>

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

" " -- `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
" " -- use this mapping also with other language servers

" obtido do clojure nvim-fennel-lsp-conjure-as-clojure-ide
nnoremap <leader>ca <Cmd>lua require('jdtls').code_action(true)<CR>
vnoremap <leader>ca <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
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
nnoremap <leader>la :lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr> 
vnoremap <leader>la :lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor())<cr> 
nnoremap <leader>lw :lua require('telescope.builtin').lsp_workspace_diagnostics()<cr> 
nnoremap <leader>lr :lua require('telescope.builtin').lsp_references()<cr> 
nnoremap <leader>li :lua require('telescope.builtin').lsp_implementations()<cr> 

" curl custom
command X set splitright | vnew | set filetype=sh | read !sh #

lua << EOF
  require'init'
EOF
