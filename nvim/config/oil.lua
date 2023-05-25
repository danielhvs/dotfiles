require("oil").setup({})
vim.keymap.set("n", "<localleader>o", require("oil").open, { desc = "Open parent directory" })
vim.keymap.set("n", "<localleader>O", ':Oil .<CR>', { desc = "Open parent directory" })
