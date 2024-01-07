return {
  'mfussenegger/nvim-jdtls',
  config = function()
    vim.cmd [[
augroup autoformat_settings
  autocmd FileType java set shiftwidth=4 tabstop=4
augroup END

augroup autoformat_settings
  autocmd FileType feature set smarttab expandtab shiftwidth=2 tabstop=2
augroup END

]]
  end
}
