let g:conjure#relative_file_root = getcwd()
let g:conjure#mapping#doc_word = "K"
let g:conjure#client#clojure#nrepl#eval#auto_require = v:false
let g:conjure#client#clojure#nrepl#connection#auto_repl#enabled = v:false
nnoremap <leader>lç :e debug.clj<CR>
nnoremap <leader>lÇ :e mg.txt<CR>
nnoremap <leader>ll :ConjureLogVSplit<CR>:set wrap<CR>
nnoremap <leader>rt mm:ConjureEvalRootForm<CR>?deftest<CR>$B"yyiwO(clojure.test/run-test <C-R>y)<ESC><CR>k0l:redraw<CR>:ConjureEvalCurrentForm<CR>dd:update<CR>`m

autocmd User ConjureEval if expand("%:t") =~ "^conjure-log-" | exec "normal G" | endif

nnoremap <localleader>1 :lua require("harpoon.ui").nav_file(1)<CR>:bd %<CR>
nnoremap <localleader>2 :lua require("harpoon.ui").nav_file(2)<CR>:ConjureEvalBuf<CR>:bd %<CR>
nnoremap <localleader>3 :lua require("harpoon.ui").nav_file(3)<CR>:ConjureEvalBuf<CR>:bd %<CR>
nnoremap <localleader>4 :lua require("harpoon.ui").nav_file(4)<CR>:ConjureEvalBuf<CR>:bd %<CR>
nnoremap <localleader>rt mm:ConjureEvalRootForm<CR>?deftest<CR>$B"yyiw`mO(clojure.test/run-test <C-R>y)<ESC>:redraw<CR>:ConjureEvalCurrentForm<CR>dd:update<CR>`m
