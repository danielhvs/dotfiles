" vim-test
" nmap <leader>tn :TestNearest<CR>
" nmap <leader>tN :!mvn clean<CR><CR>:TestNearest<CR>
nnoremap <leader>tn mm?@Test<CR>jWW"yyiw/^public.*\(class\\|interface\\|enum\)<CR>WW"cyiw`m:terminal mvn surefire:test -Dtest=<C-R>c\#<C-R>y<CR><CR><C-O>
nnoremap <leader>tN mm?@Test<CR>jWW"yyiw/^public.*\(class\\|interface\\|enum\)<CR>WW"cyiw`m:terminal mvn clean && mvn test -Dtest=<C-R>c\#<C-R>y<CR><CR><C-O>

" nmap <leader>tl :TestLast<CR>
" nmap <leader>tL :!mvn clean<CR><CR>:TestLast<CR>
let test#strategy = "neovim"
let g:test#neovim#start_normal = 1 " If using neovim strategy
