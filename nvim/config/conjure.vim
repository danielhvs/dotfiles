let g:conjure#relative_file_root = getcwd()
let g:conjure#mapping#doc_word = "K"
let g:conjure#client#clojure#nrepl#eval#auto_require = v:false
let g:conjure#client#clojure#nrepl#connection#auto_repl#enabled = v:false
" nnoremap <leader>ll :ConjureLogVSplit<CR>:set wrap<CR>:vertical resize 30<CR> :wincmd h<CR>
nnoremap <leader>ll :ConjureLogVSplit<CR>:set wrap<CR>
nnoremap <localleader>rt mm:ConjureEvalRootForm<CR>?deftest<CR>w"yyiwO(run-test <C-R>y)<ESC><CR>k0l:redraw<CR>:ConjureEvalCurrentForm<CR>dd:update<CR>`m
nnoremap <leader>rt mm:ConjureEvalRootForm<CR>?deftest<CR>w"yyiwO(run-test <C-R>y)<ESC><CR>k0l:redraw<CR>:ConjureEvalCurrentForm<CR>dd:update<CR>`m

autocmd User ConjureEval if expand("%:t") =~ "^conjure-log-" | exec "normal G" | endif

nnoremap <localleader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <localleader>2 :lua require("harpoon.ui").nav_file(2)<CR>:ConjureEvalBuf<CR>
nnoremap <localleader>3 :lua require("harpoon.ui").nav_file(3)<CR>:ConjureEvalBuf<CR>
nnoremap <localleader>4 :lua require("harpoon.ui").nav_file(4)<CR>:ConjureEvalBuf<CR>
nnoremap <localleader>- :e src/ardoq/route_tree.clj<CR>:ConjureEvalBuf<CR>:bd %<CR>
