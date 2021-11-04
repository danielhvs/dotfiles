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
source /home/danielhabib/dotfiles/nvim/config/vim-test.vim

" lua code
lua << EOF
  require'init'
  require('gitsigns').setup()
EOF
" end lua code

" nerdtree
nnoremap <expr> <leader>e g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'

augroup autoformat_settings
  autocmd FileType java set nosmarttab noexpandtab shiftwidth=2 tabstop=2
augroup END

source ~/dtp/nvim/dtp.vim
