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
o.background = "dark"
o.clipboard = "unnamedplus"
o.scrolloff = 8
o.sidescrolloff = 8
o.hidden = true
o.lazyredraw = true
o.hlsearch = false
o.splitright = true
o.splitbelow = true
o.backup = false
o.writebackup = false
o.smarttab = true
o.expandtab = true
o.wrap = true
o.errorbells = false
o.visualbell = false
o.incsearch = true
o.numberwidth = 1
o.number = true
o.relativenumber = true
o.list = false
o.mouse = ''
o.smartcase = true
o.ignorecase = true
o.autoread = true
o.showmode = false
o.cursorline = true
o.confirm = true
o.winbar = "%t%=%F"

vim.cmd [[
set iskeyword+=-
set path+=**
set listchars=tab:→\ ,trail:·
]]

-- " for `gf` to work well
-- " tim pope sensible plugin https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
vim.cmd [[
set wildignore+=**/node_modules/**,**/target/**
filetype plugin indent on
setglobal tags-=./tags tags-=./tags; tags^=./tags;
let g:loaded_perl_provider = 0
]]
