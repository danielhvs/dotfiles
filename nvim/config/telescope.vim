nnoremap <leader>tp :Telescope live_grep<CR>
nnoremap <leader>to :Telescope oldfiles only_cwd=true<CR>
nnoremap <leader>tO :Telescope oldfiles<CR>
nnoremap <leader>tY y$:Telescope live_grep<CR>p:s/\([(){}]\)/\\\1/g<CR><ESC>
nnoremap <leader>ty yiw:Telescope live_grep<CR>p0d/[A-Z]<CR>~I\.<ESC>0
nnoremap <leader>tg "zyiw:Telescope live_grep<CR>I<C-R>z<ESC>:s/\([(){}]\)/\\\1/g<CR><ESC>
nnoremap <leader>tG "zyiW:Telescope live_grep<CR>I<C-R>z<ESC>:s/\([(){}]\)/\\\1/g<CR><ESC>
nnoremap <leader>tf "zyiw:Telescope find_files<CR>I<C-R>z<ESC>
nnoremap <leader>tF "zyiW:Telescope find_files<CR>I<C-R>z<ESC>
" nnoremap <leader>tx :let @0=expand("%:t")<CR>:Telescope live_grep<CR>p
nnoremap <leader>tx :let @0=expand("%:t")<CR>:Telescope live_grep<CR>I<C-R>0<ESC>
nnoremap <leader>tX :let @0=expand("%")<CR>:Telescope live_grep<CR>I<C-R>0<ESC>
nnoremap <leader>tv yiw:Telescope live_grep<CR>id = "<C-R>0"<ESC>
nnoremap <leader>tr :Telescope resume<CR>
nnoremap <leader>ts :Telescope git_status<CR>
nnoremap <leader>tS :Telescope git_commits<CR>
nnoremap <leader>p :Telescope find_files<CR>
nnoremap <leader>tb :Telescope git_branches<CR>
nnoremap <leader>T :Telescope 
nnoremap <leader>tc :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>tE :Telescope diagnostics severity=E<CR>
nnoremap <leader>te :Telescope diagnostics bufnr=0 severity=E<CR>
nnoremap <leader>lW :Telescope diagnostics severity=W<CR>
nnoremap <leader>lw :Telescope diagnostics bufnr=0 severity=W<CR>

