return {
  'Olical/conjure',
  config = function()
    vim.cmd [[
let g:conjure#log#hud#enabled = v:false
let g:conjure#relative_file_root = getcwd()
let g:conjure#mapping#doc_word = "K"
let g:conjure#client#clojure#nrepl#eval#auto_require = v:false
let g:conjure#client#clojure#nrepl#connection#auto_repl#enabled = v:false
let g:conjure#filetype#sql = v:false
let g:conjure#log#wrap = v:true
nnoremap <leader>lç :e debug.clj<CR>

autocmd User ConjureEval if expand("%:t") =~ "^conjure-log-" | exec "normal G" | endif

nnoremap <localleader>1 :lua require("harpoon.ui").nav_file(1)<CR>:bd %<CR>
nnoremap <localleader>2 :lua require("harpoon.ui").nav_file(2)<CR>:ConjureEvalBuf<CR>:bd %<CR>
nnoremap <localleader>3 :lua require("harpoon.ui").nav_file(3)<CR>:ConjureEvalBuf<CR>:bd %<CR>
nnoremap <localleader>4 :lua require("harpoon.ui").nav_file(4)<CR>:ConjureEvalBuf<CR>:bd %<CR>

" use these mappings! -lv -lq
" use these mappings! -ece -ecr -ecw (comments)
nnoremap <leader>ll :ConjureLogVSplit<CR>:set wrap<CR><localleader>ll
nnoremap <localleader>rt :ConjureEvalBuf<CR>?deftest<CR>$B"yyiw<ESC>Go<CR>(comment (clojure.test/run-test <C-R>y))<ESC>:redraw<CR>F(lmTmt:ConjureEvalCurrentForm<CR>:update<CR><C-o><C-o>zz
nnoremap <localleader>u :find user.clj<CR>

let g:conjure#eval#inline#highlight = "clojureFunc"
let g:conjure#eval#inline#prefix = "=> "

nnoremap <localleader>q yapGo(execute! @ds (queries/select-raw ""))<ESC>F"i<CR><CR><CR><CR><ESC>2kp:ConjureEvalRootForm<CR>:update<CR>
nnoremap <localleader>Q Go(execute! @ds (queries/select-raw ""))<ESC>F"i<CR><CR><CR><CR><ESC>2kp:ConjureEvalRootForm<CR>:update<CR>
]]
  end
}
