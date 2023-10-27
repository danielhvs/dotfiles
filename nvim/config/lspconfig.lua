local lsp    = require('lspconfig')
local cmplsp = require('cmp_nvim_lsp')

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "error" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "warn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "info" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "hint" })

local setup_mappings = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
  -- buf_set_keymap("n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
  buf_set_keymap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true })
  buf_set_keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true })
  buf_set_keymap("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
  buf_set_keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.set_loclist()<CR>", { noremap = true })
  buf_set_keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true })
  buf_set_keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true })
  -- buf_set_keymap("n", "<leader>la", ":Telescope lsp_code_actions<cr>", {noremap = true})
  buf_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
  -- buf_set_keymap("v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", {noremap = true})
  buf_set_keymap("v", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
  buf_set_keymap("n", "<leader>lw", ":lua require('telescope.builtin').diagnostics()<cr>", { noremap = true })
  buf_set_keymap("n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", { noremap = true })
  buf_set_keymap("n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", { noremap = true })
  -- outline
  buf_set_keymap("n", "<leader>lO", ":Telescope lsp_document_symbols<CR>", { noremap = true })
  buf_set_keymap("n", "<leader>lK", ":lua vim.lsp.buf.outgoing_calls()<CR>", { noremap = true })
  buf_set_keymap("n", "<leader>lC", ":lua vim.lsp.buf.incoming_calls()<CR>", { noremap = true })

  vim.keymap.set('n', '<leader>lf',
    function()
      vim.lsp.buf.format { async = true }
    end, bufopts)
end

local the_capabilities = cmplsp.default_capabilities()
local the_handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
    { severity_sort = false,
      update_in_insert = false,
      underline = true,
      virtual_text = false }),
  ["textDocument/hover"] =
      vim.lsp.with(vim.lsp.handlers.hover,
        { border = "single" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
}

lsp.clojure_lsp.setup({
  -- cmd = { '/home/danielhabib/workspace/clojure-lsp/clojure-lsp' },
  on_attach = setup_mappings,
  handlers = the_handlers,
  capabilities = the_capabilities,
})


-- lsp.lua_ls.setup {
--   on_attach = setup_mappings,
--   capabilities = the_capabilities,
--   handlers = the_handlers,
--   settings = {
--     Lua = {
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },
--     },
--   },
-- }
--
-- require("treesitter-sexp").setup {
--   -- Enable/disable
--   enabled = true,
--   -- Move cursor when applying commands
--   set_cursor = false,
--   -- Set to false to disable all keymaps
--   keymaps = {
--     -- Set to false to disable keymap type
--     commands = {
--       -- Set to false to disable individual keymaps
--       swap_prev_elem = "<e",
--       swap_next_elem = ">e",
--       swap_prev_form = "<f",
--       swap_next_form = ">f",
--       promote_elem = "<LocalLeader>O",
--       promote_form = "<LocalLeader>o",
--       splice = "<LocalLeader>@",
--       slurp_left = "<(",
--       slurp_right = ">)",
--       barf_left = ">(",
--       barf_right = "<)",
--       insert_head = "<I",
--       insert_tail = ">I",
--     },
--     motions = {
--       form_start = "(",
--       form_end = ")",
--       prev_elem = "[e",
--       next_elem = "]e",
--       prev_elem_end = "[E",
--       next_elem_end = "]E",
--       prev_top_level = "[[",
--       next_top_level = "]]",
--     },
--     textobjects = {
--       inner_elem = "ie",
--       outer_elem = "ae",
--       inner_form = "if",
--       outer_form = "af",
--       inner_top_level = "iF",
--       outer_top_level = "aF",
--     },
--   },
-- }
