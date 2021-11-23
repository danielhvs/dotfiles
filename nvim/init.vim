" sao 2 arquivos diferentes!
" /home/danielhabib/.config/nvim/plugin/ReplaceWithRegister
call plug#begin('/home/danielhabib/.local/share/nvim/site/autoload')
Plug 'tpope/vim-obsession'
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
Plug 'ThePrimeagen/harpoon'
Plug 'machakann/vim-highlightedyank'
call plug#end()

" lua code
lua << EOF
  require'init'
  require('gitsigns').setup()
EOF
" end lua code

source /home/danielhabib/dotfiles/nvim/config/options.vim
source /home/danielhabib/dotfiles/nvim/config/gruvbox.vim
source /home/danielhabib/dotfiles/nvim/config/vim-buftabline.vim
source /home/danielhabib/dotfiles/nvim/config/commands.vim
source /home/danielhabib/dotfiles/nvim/config/ctrlp.vim
source /home/danielhabib/dotfiles/nvim/config/lightline.vim
source /home/danielhabib/dotfiles/nvim/config/vim-test.vim
source /home/danielhabib/dotfiles/nvim/config/nerdtree.vim
source /home/danielhabib/dotfiles/nvim/config/java.vim
source /home/danielhabib/dotfiles/nvim/config/vim-fugitive.vim
source /home/danielhabib/dotfiles/nvim/config/telescope.vim
source /home/danielhabib/dotfiles/nvim/config/tagbar.vim
source /home/danielhabib/dotfiles/nvim/config/harpoon.vim
source /home/danielhabib/dotfiles/nvim/config/vim-highlightedyank.vim
source /home/danielhabib/dotfiles/nvim/config/maps.vim

" specific
source ~/dtp/nvim/dtp.vim
