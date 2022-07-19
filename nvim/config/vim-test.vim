" vim-test
nmap <leader>tn :!mvn clean<CR><CR>:TestNearest<CR>
nmap <leader>tl :!mvn clean<CR><CR>:TestLast<CR>
let test#strategy = "neovim"
let g:test#neovim#start_normal = 1 " If using neovim strategy

