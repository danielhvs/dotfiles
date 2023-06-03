local map = require("keys").map

-- Deleting buffers
map("n", "<leader>d", ":Bdelete this<CR>")
map("n", "<leader>D", ":Bdelete other<CR>")
