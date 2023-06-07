require('telescope').setup(
  {
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

vim.keymap.set("n", "<leader>tp", ":Telescope live_grep<CR>", {});
vim.keymap.set("n", "<leader>to", ":Telescope oldfiles only_cwd=true<CR>");
vim.keymap.set("n", "<leader>tO", ":Telescope oldfiles<CR>");
vim.keymap.set("n", "<leader>tY", "\"y$:Telescope live_grep<CR>p:s/\\([(){}]\\)/\\\\\1/g<CR><ESC>");
vim.keymap.set("n", "<leader>tg", "\"zyiw:Telescope live_grep<CR>\"zp");
vim.keymap.set("n", "<leader>tf", "\"zyiw:Telescope find_files<CR>I<C-R>z<ESC>");
vim.keymap.set("n", "<leader>tF", "\"zyiW:Telescope find_files<CR>I<C-R>z<ESC>");
vim.keymap.set("n", "<leader>tx", ":let @0=expand(\"%:t\")<CR>:Telescope live_grep<CR>I<C-R>0<ESC>");
vim.keymap.set("n", "<leader>tX", ":let @0=expand(\"%\")<CR>:Telescope live_grep<CR>I<C-R>0<ESC>");
vim.keymap.set("n", "<leader>tr", ":Telescope resume<CR>");
vim.keymap.set("n", "<leader>ts", ":Telescope git_status<CR>");
vim.keymap.set("n", "<leader>tS", ":Telescope git_commits<CR>");
vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>");
vim.keymap.set("n", "<leader>tb", ":Telescope git_branches<CR>");
vim.keymap.set("n", "<leader>T", ":Telescope ");
vim.keymap.set("n", "<leader>th", ":Telescope harpoon marks<CR>");
vim.keymap.set("n", "<leader>tc", ":Telescope current_buffer_fuzzy_find<CR>");
vim.keymap.set("n", "<leader>tE", ":Telescope diagnostics severity=E<CR>");
vim.keymap.set("n", "<leader>te", ":Telescope diagnostics bufnr=0 severity=E<CR>");
vim.keymap.set("n", "<leader>tW", ":Telescope diagnostics severity=W<CR>");
vim.keymap.set("n", "<leader>tw", ":Telescope diagnostics bufnr=0 severity=W<CR>");
vim.keymap.set("n", "<leader>lO", ":Telescope lsp_document_symbols<CR>");
