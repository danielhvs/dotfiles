local map = require("keys").map

-- Deleting buffers
map("n", "<leader>d", ":Bdelete this<CR>")
map("n", "<leader>D", ":Bdelete other<CR>")
map("n", "<localleader>t", ":e t<CR>")
map("n", "<localleader>m", ":e Makefile<CR>")
