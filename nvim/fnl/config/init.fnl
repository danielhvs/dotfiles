(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

(let [options {:clipboard "unnamedplus"}] ;shared clipboard with linux
 (each [option value (pairs options)]
   (core.assoc nvim.o option value)))

;import plugin.fnl
(require :config.plugin)
