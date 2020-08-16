set runtimepath^=~/.vim/bundle/ctrlp.vim
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-commentary' " gc + motion
Plug 'tpope/vim-repeat' 
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
"refactor entity->com
let @i='d/@Tabledt"f"eDIreturn A;Oprotected String nomeTable�kb�kbela() {2jO}o/classeeaComwcwextendswcwATestaTabela?Comyiwopublic pa(String filtro) {super(filtro);}ggO@Overrided35jpggipacke�kbage br.go.�kbv.dataprev.eco.testes.util;10j0'
let @c='d/Columndf"f"D0^�khdw'
let @m="magg/Comyiw'aIpublic pa A(Object esperado) [�kb{String coluna =  �kb=�kbnew Object(){}.getClass().getEnclosingMethod().getName(*)�kb�kb)(�kb; add(esperado, coluna); return this;}j0"
let @f='/br\.gov\.dataprev\.ecoyi"OpI~/workspace_eco/eco-batch/src/main/java/AV:s/\.\/�kb�kb/\//gA.javadd'
noremap <F3> @fmB:e!<C-r>"<left><delete>
noremap <F2> 'B

"removendo setas
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

" like <leader>w saves the current file
let mapleader = ","

nmap <leader>p  :CtrlP<cr>
map <leader>ss :setlocal spell!<cr>
nmap <leader>d :bd!<cr>
map <leader>q :q!<cr>
nmap <leader>w :w!<cr>
map <leader>x :x<cr>
map <leader>l :ls<cr>
map <leader>c :set list<cr>
map <leader>C :set nolist<cr>

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
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

filetype on

" ctrl space == autocomplete
inoremap <C-@> <C-n>

" testando: centrando ao entrar em inser mode
"autocmd InsertEnter * norm zz

" autocompletar melhor em command mode 
set wildmode=longest,list,full

" cor azul numeros 
highlight LineNr ctermfg=blue

" config ctrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|eco-docs\|target'
let g:ctrlp_max_files=0 

" Copiar ate o fim da linha
map Y y$

