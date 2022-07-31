" format-align Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap <leader>fa <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nnoremap <leader>fA <Plug>(EasyAlign)
" must be in the last line
nnoremap <leader>fA mmv?^.*[EDQ] <CR>j:EasyAlign! **\|<CR>`m

nnoremap <leader>fa vip:EasyAlign! **\|<CR>

" ?^.*[EDQ] <CR>
" nnoremap <leader>a <Plug>(EasyAlign)
