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

source /home/danielhabib/dotfiles/nvim/config/options.vim
source /home/danielhabib/dotfiles/nvim/config/gruvbox.vim
source /home/danielhabib/dotfiles/nvim/config/vim-buftabline.vim
source /home/danielhabib/dotfiles/nvim/config/lsp.vim
source /home/danielhabib/dotfiles/nvim/config/commands.vim
source /home/danielhabib/dotfiles/nvim/config/ctrlp.vim
source /home/danielhabib/dotfiles/nvim/config/maps.vim

" lua code
lua << EOF
  require'init'
  require('gitsigns').setup()
EOF
" end lua code

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
