return {
  'nvim-telescope/telescope-ui-select.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup(
      {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            },
          }
        },
        defaults =
        {
          path_display = { "smart" },
          initial_mode = "normal",
          prompt_prefix = "",
          file_ignore_patterns = { "node_modules", "DS_Store", "target" },
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          layout_config = {
            horizontal = { width = 0.95 },
            --preview_width = 0.65,
            vertical = { width = 0.95 }
          },
          wrap_results = false
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" } }
        }
      })

    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "<leader>tp", ":Telescope live_grep<CR>", {})
    vim.keymap.set("n", "<leader>to", ":Telescope oldfiles only_cwd=true<CR>")
    vim.keymap.set("n", "<leader>tO", ":Telescope oldfiles<CR>")
    vim.keymap.set("n", "<leader>tY", "\"ty$:Telescope live_grep<CR>\"tpV:s/\\([(){}]\\)/\\\\\\1/g<CR>")
    vim.keymap.set("n", "<leader>tg", function() builtin.grep_string({ search = vim.fn.expand("<cword>") }) end)
    vim.keymap.set("n", "<leader>tG", function() builtin.grep_string({ search = vim.fn.expand("<cWORD>") }) end)
    vim.keymap.set("n", "<leader>tf", function() builtin.find_files({ search_file = vim.fn.expand("<cword>") }) end)
    vim.keymap.set("n", "<leader>tF", function() builtin.find_files({ search_file = vim.fn.expand("<cWORD>") }) end)
    vim.keymap.set("n", "<leader>tr", ":Telescope resume<CR>")
    vim.keymap.set("n", "<leader>ts", ":Telescope git_status<CR>")
    vim.keymap.set("n", "<leader>tS", ":Telescope git_commits<CR>")
    vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>")
    vim.keymap.set("n", "<leader>tb", ":Telescope git_branches<CR>")
    vim.keymap.set("n", "<leader>th", ":Telescope help_tags<CR>")
    vim.keymap.set("n", "<leader>T", ":Telescope ")

    vim.keymap.set("n", "<leader>tc", ":Telescope current_buffer_fuzzy_find<CR>")

    vim.keymap.set("n", "<leader>tE", ":Telescope diagnostics severity=E<CR>")
    vim.keymap.set("n", "<leader>te", ":Telescope diagnostics bufnr=0 severity=E<CR>")
    vim.keymap.set("n", "<leader>tW", ":Telescope diagnostics severity=W<CR>")
    vim.keymap.set("n", "<leader>tw", ":Telescope diagnostics bufnr=0 severity=W<CR>")
    vim.keymap.set("n", "<leader>lO", ":Telescope lsp_document_symbols<CR>")
    vim.keymap.set("n", "<leader>ti", ":Telescope diagnostics bufnr=0 severity=I<CR>")
    vim.keymap.set("n", "<leader>tI", ":Telescope diagnostics severity=I<CR>")
    telescope.load_extension("ui-select")
  end
}
