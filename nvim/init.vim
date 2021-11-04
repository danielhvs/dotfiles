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
source /home/danielhabib/dotfiles/nvim/config/lightline.vim
source /home/danielhabib/dotfiles/nvim/config/maps.vim

" lua code
lua << EOF
  require'init'
  require('gitsigns').setup()
EOF
" end lua code

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
