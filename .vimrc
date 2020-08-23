set runtimepath^=~/.vim/bundle/ctrlp.vim
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" https://github.com/vim-scripts/ReplaceWithRegister/ -> uso: gr+motion exemplo: griw
Plug 'christoomey/vim-system-copy' " cp+motion or cv+motion (cV) (cP)
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-commentary' " gc + motion
Plug 'tpope/vim-repeat' 
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-sort-motion'
" Plug 'https://github.com/kana/vim-textobj-entire'
call plug#end()

colorscheme challenger_deep
"set termguicolors colocando achei feio
set nonumber
set iskeyword+=-
set ignorecase
" When searching try to be smart about cases: se procurar com letra maiuscula
" considera smart!
set smartcase

"relativenumber
set rnu 

set path+=**
nnoremap ,alm :read ~/.gitmessage<cr>2j
nnoremap ,jdbc :r /home/danielhabib/workspace_eco/eco-batch/src/test/resources/config/jdbc.xml<cr>
:imap jk <Esc>
:imap kj <Esc>
let @f='/br\.gov\.dataprev\.ecoyi"OpI~/workspace_eco/eco-batch/src/main/java/AV:s/\.\/€kb€kb/\//gA.javadd'
noremap <F3> @fmB:e!<C-r>"<left><delete>
noremap <F2> 'B

"removendo setas
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" like <leader>w saves the current file
let mapleader = ","

nmap <leader>p  :CtrlP<cr>
map <leader>ss :setlocal spell!<cr>
nmap <leader>d :bd!<cr>
map <leader>q :q!<cr>
nmap <leader>w :w!<cr>
map <leader>x :x<cr>
map <leader>wq :wq!<cr>
map <leader>l :ls<cr>
map <leader>c :set list<cr>
map <leader>C :set nolist<cr>

map <leader>gu :Gread<cr>
map <leader>gU :Git reset %<cr><cr>:Gread<cr>

map <leader>ga :Gwrite<cr>
map <leader>gc :Gcommit -v<cr>
map <leader>gC :Gwrite<cr>:Gcommit -v<cr>

map <leader>gp :Gpush<cr>
map <leader>gg :Gstatus<cr>:wincmd o<cr>

map <leader>gf :diffget //2<cr>:diffupdate<cr>
map <leader>gj :diffget //3<cr>:diffupdate<cr>

map <leader>gd :Gvdiffsplit<cr>
map <leader>gD :Gvdiffsplit!<cr>

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
"set lazyredraw 
" No annoying sound on errors
set noerrorbells
set novisualbell

" Enable syntax highlighting
syntax enable 

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Be smart when using tabs ;)
set smarttab
set expandtab

" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

filetype on

" ctrl space == autocomplete
inoremap <C-@> <C-n>

" autocompletar melhor em command mode 
set wildmode=longest,list,full

" cor azul numeros 
highlight LineNr ctermfg=blue

" config ctrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|eco-docs\|target\|log'
let g:ctrlp_max_files=0 

" Copiar ate o fim da linha
map Y y$

" system.copy plugin https://github.com/christoomey/vim-system-copy
" let g:system_copy_silent = 1

" mudar cursos
" let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
" let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
" let &t_EI = "\<esc>[ q"  " default cursor (usually blinking block) otherwise

