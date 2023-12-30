return {
  'tpope/vim-dadbod',
  config = function()
    vim.cmd [[
    nmap <leader>sd vap:DB postgres://superuser:the_pwd@localhost:5432/customers<CR>
    vmap <leader>sd :'<'>DB postgres://superuser:the_pwd@localhost:5432/customers<CR>
]]
  end
}
