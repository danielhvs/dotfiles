local _2afile_2a = "/home/danielhabib/.config/nvim/fnl/config/plugin/lspconfig.fnl"
local _1_
do
  local name_4_auto = "config.plugin.lspconfig"
  local module_5_auto
  do
    local x_6_auto = _G.package.loaded[name_4_auto]
    if ("table" == type(x_6_auto)) then
      module_5_auto = x_6_auto
    else
      module_5_auto = {}
    end
  end
  module_5_auto["aniseed/module"] = name_4_auto
  module_5_auto["aniseed/locals"] = ((module_5_auto)["aniseed/locals"] or {})
  do end (module_5_auto)["aniseed/local-fns"] = ((module_5_auto)["aniseed/local-fns"] or {})
  do end (_G.package.loaded)[name_4_auto] = module_5_auto
  _1_ = module_5_auto
end
local autoload
local function _3_(...)
  return (require("aniseed.autoload")).autoload(...)
end
autoload = _3_
local function _6_(...)
  local ok_3f_21_auto, val_22_auto = nil, nil
  local function _5_()
    return {autoload("cmp_nvim_lsp"), autoload("lspconfig"), autoload("aniseed.nvim")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {cmplsp = "cmp_nvim_lsp", lsp = "lspconfig", nvim = "aniseed.nvim"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local cmplsp = _local_4_[1]
local lsp = _local_4_[2]
local nvim = _local_4_[3]
local _2amodule_2a = _1_
local _2amodule_name_2a = "config.plugin.lspconfig"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
vim.fn.sign_define("LspDiagnosticsSignError", {text = "\239\129\151"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "\239\129\177"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "\239\129\154"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "\239\129\153"})
local handlers = {["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, underline = true, update_in_insert = false, virtual_text = false}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
local capabilities = cmplsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach
local function _8_(client, bufnr)
  nvim.buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>la", ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "v", "<leader>la", ":lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor())<cr>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lw", ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
  return nvim.buf_set_keymap(bufnr, "n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
end
on_attach = _8_
return lsp.clojure_lsp.setup({capabilities = capabilities, handlers = handlers, on_attach = on_attach})