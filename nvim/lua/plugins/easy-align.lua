return {
  'junegunn/vim-easy-align',
  config = function()
    vim.api.nvim_set_keymap('v', '<leader>fa', [[:EasyAlign! **|<CR>]],
      { noremap = true, silent = true })
  end
}
