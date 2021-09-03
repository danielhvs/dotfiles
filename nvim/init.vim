" comandinhos: 
" :scriptnames
let mapleader = ","
set termguicolors

" set runtimepath^=~/.vim/bundle/ctrlp.vim
" sao 2 arquivos diferentes!
" /home/danielhabib/.config/nvim/plugin/ReplaceWithRegister
call plug#begin('/home/danielhabib/.local/share/nvim/site/autoload')
  Plug 'christoomey/vim-system-copy' " cp+motion or cv+motion (cV) (cP)
  Plug 'tpope/vim-surround'
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-commentary' " gc + motion
  Plug 'tpope/vim-repeat' 
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'joshdick/onedark.vim', { 'branch': 'main' }
call plug#end()

" plugin configs...
let g:airline_theme='onedark'
" colorscheme gruvbox
colorscheme onedark
set background=dark
let g:airline#extensions#tabline#enabled = 1
" fim plugin configs

set background=dark
" testando... 
set scrolloff=8
set hidden
" deixa block para nvim
set guicursor=
" antes usava set hlsearch 
set nohlsearch

" Enable syntax highlighting
filetype on
syntax enable 

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

map Y y$
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

" daniel custom leader
set path+=**
nnoremap ,alm :read ~/.gitmessage<cr>2j
nnoremap ,jdbc :r /home/danielhabib/workspace_eco/eco-batch/src/test/resources/config/jdbc.xml<cr>
let @f='/br\.gov\.dataprev\.ecoyi"OpI~/workspace_eco/eco-batch/src/main/java/AV:s/\.\/€kb€kb/\//gA.javadd'
noremap <F3> @fmC:e!<C-r>"<left><delete>
noremap <F2> 'C

" ctrl space == autocomplete
inoremap <C-Space> <C-n>

" removendo setas
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" custom leader commands
nmap <leader>json :%!jq .<cr>
nmap <leader>html :%!tidy --show-errors 0 -i -q 2>/dev/null<cr>
nmap <leader>p  :CtrlP<cr>
map <leader>ss :setlocal spell!<cr>
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
map <leader>gU :Git reset %<cr><cr>:Gread<cr>
map <leader>ga :Gwrite<cr>
map <leader>gc :Git commit -v<cr>
map <leader>gC :Gwrite<cr>:Gcommit -v<cr>
map <leader>gp :Git push<cr>
map <leader>gg :Git<cr>:wincmd o<cr>
map <leader>gf :diffget //2<cr>:diffupdate<cr>
map <leader>gh :diffget //3<cr>:diffupdate<cr>
map <leader>gd :Gvdiffsplit<cr>
map <leader>gD :Gvdiffsplit!<cr>

" config ctrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|eco-docs\|target\|log\'
let g:ctrlp_max_files=0 
" https://stackoverflow.com/questions/11873736/vim-ctrlp-plugin-manually-set-root-search-directory
let g:ctrlp_working_path_mode = 'c'

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
