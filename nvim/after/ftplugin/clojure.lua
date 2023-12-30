vim.cmd[[

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
nnoremap gs $F:l"nyeF.bgf:<C-R>n<CR>
nnoremap gn Bf/l"myeb"nyt/gg/as <C-R>n]<CR>T["fye:Telescope find_files<CR>"fpV:s/\./\//g<CR>V:s/-/_/g<CR>
nmap <leader>0 mm"yyiw-wlet[dbg_<ESC><S-M-l>a<CR>(def __<C-r>y__ dbg_)<CR>dbg_<ESC>`m=af
nmap <leader>9 mm-wlet[dbg_<ESC><S-M-l>a<CR>(def _dbg dbg_)<CR>dbg_<ESC>`m=af
nmap <leader>) mm-wlet[pdb_<ESC><S-M-l>a<CR>(clojure.pprint/pprint {:debug pdb_})<CR>pdb_<ESC>`m=af
nmap <leader>( mmwwww-o-o=af
nnoremap <leader>lÇ :e mg.txt<CR>
" snippets (role)
" nnoremap <leader>rp oset schema 'piedpiper';<CR>select from<ESC>^ea 
nnoremap <leader>rp oset schema 'lol';<CR>select from ;<ESC>^ea 
" honey
nnoremap <leader>sh mmI(-> (hh/select :e._id :e.name)<ESC>o(hh/from :e)<ESC>o(hh/where [:= 1 1]))<ESC>`m=af
nmap <leader>c1 yaf:e1.clj<CR>gggrG:w<CR>:e diff.clj<CR>
nmap <leader>c2 yaf:e2.clj<CR>gggrG:w<CR>:e diff.clj<CR>
nmap <leader>cc :wa<CR>,/
nmap <localleader>xi <I
nmap <localleader>xI <I<ESC>lmma<CR><ESC>`m
nmap <localleader>xa >I 
nmap <localleader>xA >I<CR><ESC>
nnoremap <localleader><localleader> :ConjureEvalMarkedForm<CR>
nnoremap <localleader>B :silent !sh ~/workspace/flex-files/scripts/rebuild.sh<CR>
nnoremap <leader>jk mm"yyiwgg2jo["@mui/material/<C-R>y" :default <C-R>y]<ESC>`m

" exec http
nnoremap <localleader>xx "yyiW:r!curl http://localhost:3000/<C-R>y<CR>
nnoremap <localleader>xX "yyiW:r!curl http://localhost:3000/<C-R>y

" cljstyle
vnoremap <leader>ls mm:! cljstyle pipe<CR>`m
nnoremap <leader>lS mm?^(<CR>va(:! cljstyle pipe<CR>`m
nnoremap <leader>ls mm?^(<CR>va(:! cljstyle pipe<CR>`m

]]
