" /home/danielhabib/.config/nvim/plugin/ReplaceWithRegister
call plug#begin('/home/danielhabib/.local/share/nvim/site/autoload')
Plug 'tpope/vim-surround' " ds'
Plug 'tpope/vim-abolish' " cr- (coerce to kebab, camel etc), crc cru, crs
Plug 'tpope/vim-commentary' " gc + motion
Plug 'tpope/vim-repeat' " melhora .
Plug 'tpope/vim-rhubarb' " git browse vim-fugitive
Plug 'tpope/vim-fugitive' " git
Plug 'gruvbox-community/gruvbox/'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-unimpaired'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'wellle/targets.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-dadbod'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'neovim/nvim-lspconfig'
" cmp
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'PaterJason/cmp-conjure'
Plug 'hrsh7th/nvim-cmp' " dependencies above
" clojure
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people' " depende do vim-sexp
Plug 'Olical/conjure'
" java
Plug 'mfussenegger/nvim-jdtls'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'romainl/vim-qf'
Plug 'AndrewRadev/switch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'folke/twilight.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'stevearc/oil.nvim'
Plug 'Asheq/close-buffers.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'https://gitlab.com/schrieveslaach/sonarlint.nvim'
call plug#end()
