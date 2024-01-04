local map = vim.keymap.set
map('n', '<localleader>eb', '<Plug>RestNvim<CR>')
map('n', '<localleader>er', '<Plug>RestNvimLast<CR>')
map('n', '<localleader>e!', '/#+RESPONSE<CR>j"ryy<C-W>hGo<ESC>"rp')
