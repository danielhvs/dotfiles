-- custom
local M = {}

function M.custom_lsp_implementations()
  local opts = {
    layout_config = {
      preview_width = 0
    }
  }
	require('telescope.builtin').lsp_implementations(opts)
  print("Feito")
end

function M.custom_lsp_java_references() 
  local opts = {
    layout_config = {
      preview_width = 0
    }
  }
	require('telescope.builtin').lsp_references(opts)
  print("Feito")
end

return M
