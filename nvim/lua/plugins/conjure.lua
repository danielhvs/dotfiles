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

autocmd User ConjureEval if expand("%:t") =~ "^conjure-log-" | exec "normal G" | endif

" use these mappings! -lv -lq
" use these mappings! -ece -ecr -ecw (comments)
nnoremap <leader>ll :ConjureLogVSplit<CR>:set wrap<CR><localleader>ll

let g:conjure#eval#inline#highlight = "clojureFunc"
let g:conjure#eval#inline#prefix = "=> "

]]
  end
}
