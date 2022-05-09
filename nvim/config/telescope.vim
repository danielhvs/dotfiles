lua << EOF
require('telescope').setup(
{defaults = 
  {path_display = { "smart" },
   initial_mode = "normal",
   prompt_prefix = "",
   file_ignore_patterns = {"node_modules", "DS_Store", "target" },
   borderchars = { "─","│","─","│","┌","┐","┘","└" }, 
   -- layout_config = {preview_width = 60, horizontal = {width = 0.95}, vertical = {width = 0.95}}
   layout_config = {horizontal = {width = 0.95}, vertical = {width = 0.95}},
   wrap_results = false
  },
  pickers = {
    find_files = {
      find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}}})
EOF

nnoremap <leader>tp :Telescope live_grep<CR>
nnoremap <leader>to :Telescope find_files<CR>
nnoremap <leader>tY y$:Telescope live_grep<CR>p:s/\([(){}]\)/\\\1/g<CR><ESC>
nnoremap <leader>ty yiw:Telescope live_grep<CR>p0d/[A-Z]<CR>~I\.<ESC>0
nnoremap <leader>tl yiW:Telescope find_files<CR>p0xf:r/0
nnoremap <leader>tg yiw:Telescope live_grep<CR>p:s/\([(){}]\)/\\\1/g<CR>
nnoremap <leader>tG yiW:Telescope live_grep<CR>p:s/\([(){}]\)/\\\1/g<CR><ESC>
nnoremap <leader>tf yiw:Telescope find_files<CR>p
nnoremap <leader>tF yiW:Telescope find_files<CR>p
" nnoremap <leader>tx :let @0=expand("%:t")<CR>:Telescope live_grep<CR>p
nnoremap <leader>tx :let @0=expand("%:t")<CR>:Telescope live_grep<CR>I<C-R>0<ESC>
nnoremap <leader>tX :let @0=expand("%")<CR>:Telescope live_grep<CR>I<C-R>0<ESC>
nnoremap <leader>tv yiw:Telescope live_grep<CR>id = "<C-R>0"<ESC>
nnoremap <leader>te yiw:Telescope find_files<CR>entity/<C-R>0.java<ESC>
nnoremap <leader>tN yiw:Telescope find_files<CR>p:s/\./\//g<CR><ESC>:s/-/_/g<CR><ESC>
