" clojure: https://github.com/rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide
let maplocalleader = "-"
let mapleader = ","
set termguicolors
set title

" sao 2 arquivos diferentes!
" /home/danielhabib/.config/nvim/plugin/ReplaceWithRegister
call plug#begin('/home/danielhabib/.local/share/nvim/site/autoload')
Plug 'tpope/vim-surround' " ds'
Plug 'tpope/vim-commentary' " gc + motion
Plug 'tpope/vim-repeat' " melhora .
Plug 'tpope/vim-rhubarb' " git browse vim-fugitive
Plug 'tpope/vim-fugitive' " git
Plug 'gruvbox-community/gruvbox/'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-unimpaired'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
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
Plug 'tpope/vim-dadbod'
Plug 'vim-test/vim-test'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
call plug#end()

" gruvbox
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" buftabline
let g:buftabline_numbers    = 0
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
set background=dark
" fim plugin configs

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
nnoremap <leader>alm :read ~/.gitmessage<CR>2j

" window
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" disable ex mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" custom default remapping
nnoremap '' ``
nnoremap z<CR> zt

" removendo setas
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" custom leader commands
nmap <leader>d :bd!<CR>
map <leader>q :q<CR>
nmap <leader>w :update<CR>
map <leader>x :x<CR>
map <leader>c :set list<CR>
map <leader>C :set nolist<CR>
" usar ]b do vim-unimpaired
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" terminal
tnoremap <Esc> <C-\><C-n>

" formats comeca com f
nmap <leader>fJ ggdG:r !jq '' %<CR><CR>
nmap <leader>fj y%:e /tmp/json.json<CR>p:w<CR>d%:r !jq '' %<CR>d%<C-O><C-O>gr%:bd! /tmp/json.json<CR>:!rm /tmp/json.json<CR><CR>
nmap <leader>fh :%!tidy --show-errors 0 -i -q 2>/dev/null<CR>

" git 
map <leader>gc :vertical topleft Git commit -v<CR>
map <leader>gp :Git push<CR>
map <leader>gg :vertical topleft Git<CR>
map <leader>gf :G pull<CR>
map <leader>gt yiW:G tag <C-R>0
map <leader>gT :G push --tags<CR> 
map <leader>gl :Git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=iso<CR>
map <leader>g0 :0Gclog<CR>
map <leader>go :Git checkout %<CR>
map <leader>ga :Git add %<CR>
map <leader>gw :GBrowse<CR>:!i3-msg workspace number 2<CR>
map <leader>gb :Git blame<CR>
map <leader>gs :Git! show<CR>:wincmd w<CR>:wincmd o<CR>
map <leader>gS :Git! log --all -p -- %<CR>:wincmd w<CR>:wincmd o<CR>
map <leader>ge :Gedit<CR>

nnoremap Y y$
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap J mzJ`z

" telescope
nnoremap <leader>tp :Telescope live_grep<CR>
nnoremap <leader>to :Telescope find_files<CR>
nnoremap <leader>tY y$:Telescope live_grep<CR><C-R>0<ESC>:s/)/\\)/g<CR>:s/(/\\(/g<CR><esc>
nnoremap <leader>tg yiw:Telescope live_grep<CR><C-R>0<ESC>:s/)/\\)/g<CR>:s/(/\\(/g<CR><esc>
nnoremap <leader>tG yiW:Telescope live_grep<CR><C-R>0<ESC>:s/)/\\)/g<CR>:s/(/\\(/g<CR><esc>
nnoremap <leader>tf yiw:Telescope find_files<CR><C-R>0<esc>
nnoremap <leader>tF yiW:Telescope find_files<CR><C-R>0<esc>
nnoremap <leader>tx :let @0=expand("%:t")<CR>:Telescope live_grep<CR><C-R>0<esc>
nnoremap <leader>tX :let @0=expand("%")<CR>:Telescope live_grep<CR><C-R>0<esc>
nnoremap <leader>tv yiw:Telescope live_grep<CR>id = "<C-R>0"<esc>
nnoremap <leader>ts "ayiwgeb~"cyiwu:buffer <C-R>c.java<CR>/\<<C-R>a\><CR>
nnoremap <leader>te yiw:Telescope find_files<CR>entity/<C-R>0<esc>

" terminal
nnoremap <leader>tt :lcd %:p:h<CR>:terminal<CR>A

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

" lua code
lua << EOF
  require'init'
  require('gitsigns').setup()
EOF
" end lua code

" ctrlp config
nmap <leader>p :CtrlP<CR>
nmap <leader>o :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|eco-docs\|target\|log\'
let g:ctrlp_max_files=0 
let g:ctrlp_by_filename = 1

" java lsp
"  `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
"  use this mapping also with other language servers
nnoremap <leader>la <Cmd>lua require('jdtls').code_action()<CR>
vnoremap <leader>la <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
nnoremap <leader>lm <Cmd>lua require'jdtls'.organize_imports()<CR>
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
nnoremap <leader>lw :lua require('telescope.builtin').lsp_workspace_diagnostics()<CR> 
nnoremap <leader>lr :lua require('telescope.builtin').lsp_references()<CR> 
nnoremap <leader>lR :lua require('daniel').custom_lsp_java_references()<CR> 
nnoremap <leader>li :lua require('telescope.builtin').lsp_implementations()<CR> 
nnoremap <leader>lI :lua require('daniel').custom_lsp_implementations()<CR> 

" outline 
nmap <leader>lo :TagbarOpenAutoClose<CR>

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

" neovim
let g:loaded_perl_provider = 0
set cursorline

" vim-test
nmap <leader>tn :TestNearest<CR>
nmap <leader>tl :TestLast<CR>
let test#strategy = "neovim"
let g:test#neovim#start_normal = 1 " If using neovim strategy

" nerdtree
nnoremap <expr> <leader>e g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'

" integracao com outros aplicativos
nmap <leader>fw yiW:!brave-browser <C-R>0 &<CR>
nmap <leader>fW :!brave-browser % &<CR>

" 'escape':
" exemplo: deixar sempre no inicio o caracter a escapar inclusive colocando
" varios um do lado do outro
nmap <leader>fe xV:s/<C-R>"/\\<C-R>"/g<CR>

" vim voltar para mesma posicao
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

augroup autoformat_settings
  autocmd FileType java set nosmarttab noexpandtab shiftwidth=2 tabstop=2
augroup END

" java
nnoremap <leader>jo ciWLOG.error("daniel: ");<esc>2hi
nnoremap <leader>jO ^y$oLOG.error("daniel: <esc>pa");<esc>
nnoremap <leader>jl mmyiwoSystem.out.println("daniel: <esc>pa");<esc>`m
nnoremap <leader>jL mmyiWoSystem.out.println("daniel: <esc>pa");<esc>`m

source ~/dtp/nvim/dtp.vim
