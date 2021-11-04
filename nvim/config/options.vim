" clojure: https://github.com/rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide
let maplocalleader = "-"
let mapleader = ","

set termguicolors
set title

" source /home/danielhabib/dotfiles/nvim/config/vim-buftabline.vim

set background=dark
set scrolloff=1
set hidden
set nohlsearch
set lazyredraw
set splitright
set splitbelow
set nobackup
set nowritebackup
set noswapfile
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent 
set smartindent 
set wrap 
set noerrorbells
set novisualbell
set incsearch 
set nonumber
set iskeyword+=-
set ignorecase
set smartcase
set relativenumber
set nu
set path+=**
"
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
