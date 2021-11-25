(module config.plugin.conjure
  {autoload {nvim aniseed.nvim}})

(set nvim.g.conjure#mapping#doc_word "K")
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
(nvim.set_keymap :n :<leader>ll ":ConjureLogVSplit<CR> :set wrap<CR> :vertical resize 30<CR> :wincmd h<CR>" {:noremap true})
