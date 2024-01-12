vim.cmd [[

nnoremap <leader>jl mm"yyiw?deftest\\|defn\\|defmethod<CR>W"fyiW'mo(clojure.pprint/pprint {:debug "<esc>"fpa <ESC>"ypa" :data <esc>"ypa})<esc>`m
nnoremap <leader>ld ggyG:silent! bwipeout! debug.clj<CR>:!rm debug.clj<CR>:e debug.clj<CR>P:w!<CR>
nnoremap <leader>lD :e debug.clj<CR>
nnoremap <leader>l? :LspInfo<CR>
nnoremap gn Bf/ "nyE:Telescope live_grep<CR>I <C-R>n<ESC>
nnoremap gN b"nyt/gg/as <C-R>n<CR>T["fye:Telescope find_files<CR>"fpV:s/\./\//g<CR>V:s/-/_/g<CR>
nnoremap <leader>cl :!clj-kondo --lint %<CR>
nnoremap <leader>/ :terminal difft 1.clj 2.clj<CR>
nnoremap <leader>? :!meld 1.clj 2.clj<CR>
nnoremap <leader>g5 :!git cherry-pick instrument && git reset HEAD^<CR>
nnoremap gn Bf/l"myeb"nyt/gg/as <C-R>n]<CR>T["fye:Telescope find_files<CR>"fpV:s/\./\//g<CR>V:s/-/_/g<CR>
nmap <leader>0 mm"yyiw-wlet[dbg_<ESC><S-M-l>a<CR>(def __<C-r>y__ dbg_)<CR>dbg_<ESC>`m=af
nmap <leader>9 mm-wlet[dbg_<ESC><S-M-l>a<CR>(def _dbg dbg_)<CR>dbg_<ESC>`m=af
nmap <leader>) mm-wlet[pdb_<ESC><S-M-l>a<CR>(clojure.pprint/pprint {:debug pdb_})<CR>pdb_<ESC>`m=af
nmap <leader>( mmwwww-o-o=af
nnoremap <leader>lÇ :e mg.txt<CR>
nmap <leader>c1 yaf:e1.clj<CR>gggrG:w<CR>:e diff.clj<CR>
nmap <leader>c2 yaf:e2.clj<CR>gggrG:w<CR>:e diff.clj<CR>
nmap <leader>cc :wa<CR>,/
nnoremap <localleader><localleader> :ConjureEvalMarkedForm<CR>
nnoremap <localleader>B :silent !sh ~/workspace/flex-files/scripts/rebuild.sh<CR>
nnoremap <leader>jk mm"yyiwgg2jo["@mui/material/<C-R>y" :default <C-R>y]<ESC>`m
nnoremap <localleader>rt :ConjureEvalBuf<CR>?deftest<CR>$B"yyiw<ESC>Go<CR>(comment (clojure.test/run-test <C-R>y))<ESC>:redraw<CR>F(lmTmt:ConjureEvalCurrentForm<CR>:update<CR><C-o><C-o>zz
" cljstyle
vnoremap <leader>ls mm:! cljstyle pipe<CR>`m
nnoremap <leader>lS mm?^(<CR>va(:! cljstyle pipe<CR>`m
nnoremap <leader>ls mm?^(<CR>va(:! cljstyle pipe<CR>`m
nnoremap <localleader>q yapGo(execute! @ds (queries/select-raw ""))<ESC>F"i<CR><CR><CR><CR><ESC>2kp:ConjureEvalRootForm<CR>:update<CR>
nnoremap <localleader>Q Go(execute! @ds (queries/select-raw ""))<ESC>F"i<CR><CR><CR><CR><ESC>2kp:ConjureEvalRootForm<CR>:update<CR>

]]


local function clj_command(command_name)
  local params = {
    command = command_name,
    arguments = {
      "file://" .. (vim.fn.expand "%:p"),
      vim.fn.line "." - 1,
      vim.fn.col "." - 1 },
  }
  vim.lsp.buf.execute_command(params)
end

vim.keymap.set("n", "<leader>lt", function() clj_command("thread-first-all") end, { noremap = true })
vim.keymap.set("n", "<leader>lT", function() clj_command("thread-last-all") end, { noremap = true })
vim.keymap.set("n", "<leader>lI", function() clj_command("inline-symbol") end, { noremap = true })
vim.keymap.set("n", "<leader>lm", function() clj_command("clean-ns") end, { noremap = true })
vim.keymap.set("n", "<leader>lu", function() clj_command("unwind-thread") end, { noremap = true })
vim.keymap.set("n", "<leader>lU", function() clj_command("unwind-all") end, { noremap = true })
-- FIXME not working
vim.keymap.set("n", "<leader>ll", function() clj_command("move-to-let") end, { noremap = true })
-- FIXME not working
vim.keymap.set("n", "<leader>lL", function() clj_command("introduce-let") end, { noremap = true })

-- advanced edits mnemonic "add code..."
vim.keymap.set("n", "<leader>ai", [[<I]], { remap = true })
vim.keymap.set("n", "<leader>aI", [[<I<ESC>lmma<CR><ESC>`m]], { remap = true })
vim.keymap.set("n", "<leader>aa", [[>I<CR>]], { remap = true })
vim.keymap.set("n", "<leader>aA", [[>I<CR><ESC>P]], { remap = true })
