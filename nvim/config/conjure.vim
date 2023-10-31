let g:conjure#relative_file_root = getcwd()
let g:conjure#mapping#doc_word = "K"
let g:conjure#client#clojure#nrepl#eval#auto_require = v:false
let g:conjure#client#clojure#nrepl#connection#auto_repl#enabled = v:false
let g:conjure#filetype#sql = v:false
nnoremap <leader>lç :e debug.clj<CR>

nnoremap <localleader>1 :lua require("harpoon.ui").nav_file(1)<CR>:bd %<CR>
nnoremap <localleader>2 :lua require("harpoon.ui").nav_file(2)<CR>:ConjureEvalBuf<CR>:bd %<CR>
nnoremap <localleader>3 :lua require("harpoon.ui").nav_file(3)<CR>:ConjureEvalBuf<CR>:bd %<CR>
nnoremap <localleader>4 :lua require("harpoon.ui").nav_file(4)<CR>:ConjureEvalBuf<CR>:bd %<CR>

" use these mappings! -lv -lq
" use these mappings! -ece -ecr -ecw (comments)
nnoremap <leader>ll :ConjureLogVSplit<CR>:set wrap<CR><localleader>ll
nnoremap <localleader>rt :ConjureEvalBuf<CR>?deftest<CR>$B"yyiw<ESC>Go<CR>(comment (clojure.test/run-test <C-R>y))<ESC>:redraw<CR>F(lmJma:ConjureEvalCurrentForm<CR>:update<CR><C-o><C-o>zz

let g:conjure#eval#inline#highlight = "clojureFunc"
let g:conjure#eval#inline#prefix = "=> "
