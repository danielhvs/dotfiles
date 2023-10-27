" vim-test (custom)
" 
" vim.keymap.set('n', "<leader>tN", jdtls.test_class, bufopts)
" vim.keymap.set('n', "<leader>tn", jdtls.test_nearest_method, bufopts)

" " Class
" nnoremap <leader>tN mmgg/^class<CR>W"cyiw`m:terminal $LOCAL_MVN test -Dtest=<C-R>c <CR>
" nnoremap <leader>tk mmgg/^class<CR>W"cyiw`m:terminal $LOCAL_MVN test -Dtest=<C-R>c <CR>

" " All
" nnoremap <leader>ta :terminal $LOCAL_MVN clean test <CR><C-O>

" " Nested
" nnoremap <leader>tn mm?@Nested<CR>j0/class<CR>W"nyiwgg/^class<CR>W"cyiw`m:terminal $LOCAL_MVN test -Dtest=<C-R>c\$<C-R>n <CR>

" " Method
" nnoremap <leader>tm mm?@Test<CR>/void<CR>W"myiwgg/^class<CR>W"cyiw`m:terminal $LOCAL_MVN test -Dtest=<C-R>c\#<C-R>m <CR>
" nnoremap <leader>tM mm?@Nested<CR>j0/class<CR>W"nyiw`m?@Test<CR>/void<CR>W"myiwgg/^class<CR>W"cyiw`m:terminal $LOCAL_MVN test -Dtest=<C-R>c\$<C-R>n\#<C-R>m <CR>

" " Olds... ç
nnoremap <localleader>rt mm?@Test<CR>/void<CR>W"yyiw/^public.*\(class\\|interface\\|enum\)<CR>WW"cyiw`m:terminal mvn surefire:test -Dtest=<C-R>c\#<C-R>y<CR><CR><C-O>
" nnoremap <leader>çN mm?@Test<CR>jWW"yyiw/^public.*\(class\\|interface\\|enum\)<CR>WW"cyiw`m:terminal mvn surefire:test -Dtest=<C-R>c<CR>
" nnoremap <leader>ça :terminal mvn clean test<CR><C-O>
