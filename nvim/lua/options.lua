vim.cmd [[
set clipboard=unnamedplus
set numberwidth=1 
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
set wrap 
set noerrorbells
set novisualbell
set incsearch 
set nonumber
set iskeyword+=-
set ignorecase
set smartcase
set relativenumber
set number
set path+=**
set listchars=tab:→\ ,trail:·
set nolist
set mouse=
]]

-- " for `gf` to work well
-- " tim pope sensible plugin https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
vim.cmd[[
set wildignore+=**/node_modules/**,**/target/**
set autoread
syntax enable
filetype plugin indent on
setglobal tags-=./tags tags-=./tags; tags^=./tags;
set noshowmode 
let g:loaded_perl_provider = 0
set cursorline
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
]]

local g = vim.g
g.maplocalleader = "-"
g.mapleader = ","

local o = vim.opt
o.title = true
o.termguicolors = true
o.shiftwidth = 2
o.tabstop = 2
o.autoindent = true
o.smartindent = true
