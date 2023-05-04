local lsp = require('lspconfig')
local cmplsp  = require('cmp_nvim_lsp')

vim.fn.sign_define("LspDiagnosticsSignError", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})

local _1_ = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
  -- buf_set_keymap("n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
  buf_set_keymap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
  buf_set_keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
  buf_set_keymap("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
  -- buf_set_keymap("n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true})
  buf_set_keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.set_loclist()<CR>", {noremap = true})
  buf_set_keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", {noremap = true})
  buf_set_keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true})
  -- buf_set_keymap("n", "<leader>la", ":Telescope lsp_code_actions<cr>", {noremap = true})
  buf_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
  -- buf_set_keymap("v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", {noremap = true})
  buf_set_keymap("v", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
  -- buf_set_keymap("n", "<leader>lw", ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", {noremap = true})
  buf_set_keymap("n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
  buf_set_keymap("n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
	-- outline
  buf_set_keymap("n", "<leader>lO", ":Telescope lsp_document_symbols<CR>", {noremap = true})
  buf_set_keymap("n", "<leader>lK", ":lua vim.lsp.buf.outgoing_calls()<CR>", {noremap = true})
  buf_set_keymap("n", "<leader>lC", ":lua vim.lsp.buf.incoming_calls()<CR>", {noremap = true})

  buf_set_keymap("n", "<leader>lR", ":lua require('daniel').custom_lsp_java_references()<cr>", {noremap = true})
  buf_set_keymap("n", "<leader>lI", ":lua require('daniel').custom_lsp_implementations()<cr>", {noremap = true})

  vim.keymap.set('n', '<leader>lf', 
  function() 
    vim.lsp.buf.format { async = true } 
  end, bufopts)
end

lsp.clojure_lsp.setup({
  -- cmd = { '/home/danielhabib/workspace/clojure-lsp/clojure-lsp' },
  on_attach = _1_,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
    {severity_sort = true, update_in_insert = false, underline = true, virtual_text = false}),
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), 
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}, 
     capabilities = cmplsp.default_capabilities()})
