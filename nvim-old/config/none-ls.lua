local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- null_ls.builtins.formatting.stylua -- not working b/c I'm running on a too old os: ubuntu 18.04
  },
})

-- below may be to auto format when writting
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- require("null-ls").setup({
--   sources = lSsources,
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format({
--             bufnr = bufnr,
--             filter = function(client)
--               return client.name == "null-ls"
--             end,
--           })
--         end,
--       })
--     end
--   end,
-- })
