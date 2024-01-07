return function(_, bufnr)
  local bufopts = { noremap = true, silent = false, buffer = bufnr }
  local function key_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  key_map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
  key_map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
  key_map("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true })
  key_map("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true })
  key_map("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
  key_map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true })
  key_map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true })
  key_map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
  key_map("v", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
  key_map("n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", { noremap = true })
  key_map("n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", { noremap = true })
  -- outline
  key_map("n", "<leader>lO", ":Telescope lsp_document_symbols<CR>", { noremap = true })

  vim.keymap.set('v', '<leader>lf', function() vim.lsp.buf.format() end, bufopts)
  vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end
