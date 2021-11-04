" vim-test
nmap <leader>tn :TestNearest<CR>
nmap <leader>tl :TestLast<CR>
let test#strategy = "neovim"
let g:test#neovim#start_normal = 1 " If using neovim strategy

