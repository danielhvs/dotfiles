nnoremap <leader>tp :Telescope live_grep<CR>
nnoremap <leader>to :Telescope find_files<CR>
nnoremap <leader>tY y$:Telescope live_grep<CR><C-R>0<ESC>:s/)/\\)/g<CR>:s/(/\\(/g<CR><esc>
nnoremap <leader>tg yiw:Telescope live_grep<CR><C-R>0<ESC>:s/)/\\)/g<CR>:s/(/\\(/g<CR><esc>
nnoremap <leader>tG yiW:Telescope live_grep<CR><C-R>0<ESC>:s/)/\\)/g<CR>:s/(/\\(/g<CR><esc>
nnoremap <leader>tf yiw:Telescope find_files<CR><C-R>0<esc>
nnoremap <leader>tF yiW:Telescope find_files<CR><C-R>0<esc>
nnoremap <leader>tx :let @0=expand("%:t")<CR>:Telescope live_grep<CR><C-R>0<esc>
nnoremap <leader>tX :let @0=expand("%")<CR>:Telescope live_grep<CR><C-R>0<esc>
nnoremap <leader>tv yiw:Telescope live_grep<CR>id = "<C-R>0"<esc>
nnoremap <leader>ts b2l"aywbgeb~"cyiwu:buffer <C-R>c.java<CR>/ .*<C-R>a(<CR>zz
nnoremap <leader>te yiw:Telescope find_files<CR>entity/<C-R>0<esc>

