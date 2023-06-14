" clojure: https://github.com/rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide
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

set noshowmode " lighline plugin

" neovim
let g:loaded_perl_provider = 0
set cursorline

" vim voltar para mesma posicao
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
