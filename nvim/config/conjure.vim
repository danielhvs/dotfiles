let g:conjure#relative_file_root = getcwd()
let g:conjure#mapping#doc_word = "K"
let g:conjure#client#clojure#nrepl#eval#auto_require = v:false
let g:conjure#client#clojure#nrepl#connection#auto_repl#enabled = v:false
" nnoremap <leader>ll :ConjureLogVSplit<CR>:set wrap<CR>:vertical resize 30<CR> :wincmd h<CR>
nnoremap <leader>ll :ConjureLogVSplit<CR>:set wrap<CR>

autocmd User ConjureEval if expand("%:t") =~ "^conjure-log-" | exec "normal G" | endif
