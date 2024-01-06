return {
  'Olical/conjure',
  config = function()
    --  use these mappings! -lv -lq
    --  use these mappings! -ece -ecr -ecw (comments)
    vim.g['conjure#log#hud#enabled'] = false
    vim.g['conjure#mapping#doc_word'] = "K"
    vim.g['conjure#relative_file_root'] = vim.fn.getcwd()
    vim.g['conjure#client#clojure#nrepl#eval#auto_require'] = false
    vim.g['conjure#client#clojure#nrepl#connection#auto_repl#enabled'] = false
    vim.g['conjure#filetype#sql'] = false
    vim.g['conjure#log#wrap'] = true
    vim.g['conjure#eval#inline#highlight'] = 'clojureFunc'
    vim.g['conjure#eval#inline#prefix'] = '=> '
  end
}
