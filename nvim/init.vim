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
" Plug 'airblade/vim-gitgutter'
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
" Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" Plug 'google/vim-glaive'
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
set wildmode=longest,list,full
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
nnoremap <leader>alm :read ~/.gitmessage<cr>2j

" window
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" disable ex mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" removendo setas
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" custom leader commands
nmap <leader>d :bd!<cr>
map <leader>q :q<cr>
nmap <leader>w :w!<cr>
map <leader>x :x<cr>
map <leader>c :set list<cr>
map <leader>C :set nolist<cr>
" usar ]b do vim-unimpaired
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" terminal
tnoremap <Esc> <C-\><C-n>

" formats comeca com f
nmap <leader>fj :%!jq .<cr>
nmap <leader>fh :%!tidy --show-errors 0 -i -q 2>/dev/null<cr>

" sets comecam com <leader>s
map <leader>sh :set hlsearch!<cr>

" git 
map <leader>gc :vertical Git commit -v<cr>
map <leader>gp :Git push<cr>
map <leader>gg :vertical Git<cr>
map <leader>gd :Gvdiffsplit<cr>:windo set wrap<cr>
map <leader>gf :diffget //2<cr>:diffupdate<cr>
map <leader>gh :diffget //3<cr>:diffupdate<cr>
map <leader>gl :0Gclog<cr>
map <leader>go :Git checkout %<cr>
map <leader>ga :Git add %<cr>
map <leader>gw :GBrowse<cr>:!i3-msg workspace number 2<cr>
map <leader>gb :Git blame<cr>

nnoremap Y y$
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap J mzJ`z

" telescope
nnoremap <leader>tY y$:Telescope live_grep<cr><C-R>0<esc>
nnoremap <leader>tg yiw:Telescope live_grep<cr><C-R>0<esc>
nnoremap <leader>tG yiW:Telescope live_grep<cr><C-R>0<esc>
nnoremap <leader>tf yiw:Telescope find_files<cr><C-R>0<esc>
nnoremap <leader>tF yiW:Telescope find_files<cr><C-R>0<esc>
nnoremap <leader>tx :let @0=expand("%:t")<CR>:Telescope live_grep<cr><C-R>0<esc>
nnoremap <leader>tX :let @0=expand("%")<CR>:Telescope live_grep<cr><C-R>0<esc>

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

lua << EOF
  require'init'
  require('gitsigns').setup()
EOF

" ctrlp config
nmap <leader>p :CtrlP<cr>
nmap <leader>o :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|eco-docs\|target\|log\'
let g:ctrlp_max_files=0 
let g:ctrlp_by_filename = 1

" java lsp
"  `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
"  use this mapping also with other language servers
nnoremap <leader>la <Cmd>lua require('jdtls').code_action()<CR>
vnoremap <leader>la <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
" nnoremap <leader>lo <Cmd>lua require'jdtls'.organize_imports()<CR>
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
nnoremap <leader>lw :lua require('telescope.builtin').lsp_workspace_diagnostics()<cr> 
nnoremap <leader>lr :lua require('telescope.builtin').lsp_references()<cr> 
nnoremap <leader>li :lua require('telescope.builtin').lsp_implementations()<cr> 

" fixme ja tem lo
nmap <leader>lo :TagbarOpenAutoClose<cr>/

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
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
let test#strategy = "neovim"
let g:test#neovim#start_normal = 1 " If using neovim strategy

" " google autoformat for java
" call glaive#Install
" augroup autoformat_settings
"   autocmd FileType java AutoFormatBuffer google-java-format
" augroup END
" Glaive codefmt google_java_executable="java -jar /home/danielhabib/dev/google-java-format-1.11.0-all-deps.jar"

" nerdtree
nnoremap <leader>e :NERDTreeFind<cr>

" dtp 
nmap <leader>sb :cd ~/workspace_eco/sibe-pu-repo<CR>
nmap <leader>cs :cd ~/workspace_eco/gestao-projeto<CR>
nmap <leader>fs /execute<cr>z<cr>
nmap <leader>fc /class<cr>z.
nmap <leader>fw yiW:!brave-browser <C-R>0 &<cr>
" 'escape':
nmap <leader>fe mzylviW:s/<C-R>0/\\<C-R>0/g<cr>`zd2l


