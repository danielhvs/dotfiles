" comandinhos: 
" :scriptnames
let maplocalleader = "-"
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
   " Plug 'morhetz/gruvbox'
   Plug 'gruvbox-community/gruvbox/'
   Plug 'ap/vim-buftabline'
   Plug 'tpope/vim-unimpaired'
   Plug 'airblade/vim-gitgutter'
  " Plug 'mfussenegger/nvim-jdtls'
  " " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'hrsh7th/nvim-cmp'
call plug#end()

" TODO clojure https://github.com/rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide

" plugin configs...

" coc
" source $HOME/.config/nvim/plug-config/coc.vim

" gruvbox
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" buftabline
let g:buftabline_numbers    = 0
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
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
nnoremap <F2> <C-o>

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
nmap <leader>- :bNext<cr>

" git nao uso muito...
map <leader>gc :Git commit -v<cr>:wincmd o<cr>
map <leader>gC :Gwrite<cr>:Gcommit -v<cr>
map <leader>gp :Git push<cr>
map <leader>gg :Git<cr>:wincmd o<cr>
map <leader>gf :diffget //2<cr>:diffupdate<cr>
map <leader>gh :diffget //3<cr>:diffupdate<cr>
map <leader>gl :0Gclog<cr>
map <leader>gco :Git checkout %<cr>
map <leader>ga :Git add %<cr>

" conjure
" map <leader>e :ConjureEval<cr>

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

" ctrlp
let g:ctrlp_map = ',p'
" ctrlp fim

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

" " treesitter
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   ignore_install = { "javascript" }, -- List of parsers to ignore installing
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = { "c", "rust" },  -- list of language that will be disabled
"     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"     -- Using this option may slow down your editor, and you may see some duplicate highlights.
"     -- Instead of true it can also be a list of languages
"     additional_vim_regex_highlighting = false,
"   },
" }
" EOF


" " LSP nativo inicio
" if has('nvim-0.5')
"   augroup lsp
"     au!
"     au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
"   augroup end
" endif


" " -- `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
" " -- use this mapping also with other language servers
" nnoremap <leader>ca <Cmd>lua require('jdtls').code_action()<CR>
" vnoremap <leader>ca <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
" nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>
" nnoremap <leader>i <Cmd>lua require'jdtls'.organize_imports()<CR>
" nnoremap <F2> <C-o>

" " LSP config (the mappings used in the default file don't quite work right)
" nnoremap <silent> <F3> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <C-A-h> <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" " LSP nativo fim

" " completion-nvim inicio
" " lua require'lspconfig'.jdtls.setup{on_attach=require'completion'.on_attach}
" autocmd BufEnter * lua require'completion'.on_attach()

" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
" " Avoid showing message extra message when using completion
" set shortmess+=c
" " possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
" let g:completion_enable_snippet = v:null
" let g:completion_enable_auto_paren = 1
" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)
" " completion-nvim fim
" let g:completion_chain_complete_list = {
" 			\'default' : {
" 			\	'default' : [
" 			\		{'complete_items' : ['lsp', 'buffer']},
" 			\		{'mode' : 'file'}
" 			\	],
" 			\	'comment' : [],
" 			\	'string' : []
" 			\	},
" 			\'python' : [
" 			\	{'complete_items': ['ts']}
" 			\	],
" 			\'lua' : [
" 			\	{'complete_items': ['ts']}
" 			\	],
" 			\}

lua << EOF
  require'init'
EOF
