" format-align Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap <leader>fa <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nnoremap <leader>fA <Plug>(EasyAlign)
" must be in the last line
nnoremap <leader>fa mmv?Dado \\|Entao \\|E \\|Quando <CR>j:EasyAlign! **\|<CR>`m

nnoremap <leader>fA vip:EasyAlign! **\|<CR>

" ?^.*[EDQ] <CR>
" nnoremap <leader>a <Plug>(EasyAlign)
