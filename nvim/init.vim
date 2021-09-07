" comandinhos: 
" :scriptnames
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
  Plug 'ctrlpvim/ctrlp.vim' 
  Plug 'sheerun/vim-polyglot'
  Plug 'morhetz/gruvbox'
  Plug 'ap/vim-buftabline'
  Plug 'tpope/vim-unimpaired'
  Plug 'airblade/vim-gitgutter'
  Plug 'mfussenegger/nvim-jdtls'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" plugin configs...

" coc
source $HOME/.config/nvim/plug-config/coc.vim

" gruvbox
let g:gruvbox_contrast_dark="hard"

" buftabline
let g:buftabline_numbers    = 0
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
colorscheme gruvbox
set background=dark
" fim plugin configs

" testando... 
set scrolloff=8
set hidden
set guicursor=
" antes usava set hlsearch 
set nohlsearch

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
nnoremap ,jdbc :r /home/danielhabib/workspace_eco/eco-batch/src/test/resources/config/jdbc.xml<cr>
let @f='/br\.gov\.dataprev\.ecoyi"OpI~/workspace_eco/eco-batch/src/main/java/AV:s/\.\/€kb€kb/\//gA.javadd'
noremap <F3> @fmC:e!<C-r>"<left><delete>
noremap <F2> 'C

" ctrl space == autocomplete
" inoremap <C-Space> <C-n>

" removendo setas
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" custom leader commands
nmap <leader>json :%!jq .<cr>
nmap <leader>html :%!tidy --show-errors 0 -i -q 2>/dev/null<cr>
nmap <leader>p :CtrlP<cr>
nmap <leader>o :CtrlPBuffer<cr>
nmap <leader>d :bd!<cr>
map <leader>q :q!<cr>
nmap <leader>w :w!<cr>
map <leader>x :x<cr>
map <leader>wq :wq!<cr>
map <leader>c :set list<cr>
map <leader>C :set nolist<cr>
nmap <leader>l :bNext<cr>

" git nao uso muito...
map <leader>gu :Gread<cr>
map <leader>ga :Gwrite<cr>
map <leader>gc :vertical Git commit -v<cr>
map <leader>gC :Gwrite<cr>:Gcommit -v<cr>
map <leader>gp :Git push<cr>
map <leader>gg :vertical Git<cr>
map <leader>gf :diffget //2<cr>:diffupdate<cr>
map <leader>gh :diffget //3<cr>:diffupdate<cr>
map <leader>gd :Gvdiffsplit<cr>
map <leader>gD :Gvdiffsplit!<cr>
map <leader>gl :0Gclog<cr>
map <leader>gco :Git checkout %<cr>

" config ctrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|eco-docs\|target\|log\'
let g:ctrlp_max_files=0 
let g:ctrlp_by_filename = 1

set showmatch
nnoremap ,m ddp
nnoremap ,. kddpk
" copia tudo para ctrl v
nmap <leader>Y mkggcpG'k

" manter centralizado
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap # #zzzv
nnoremap * *zzzv
nnoremap Y y$
nnoremap <C-d> dd

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

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
