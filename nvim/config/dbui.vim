nnoremap <leader>sD :DBUIToggle<CR>
let g:db_ui_use_nvim_notify = v:true

augroup dbui
  autocmd!
  autocmd BufRead,BufNewFile *.dbout set filetype=dbout
  autocmd BufReadPost *.dbout nested call db_ui#save_dbout(expand('<afile>'))
  autocmd FileType dbout setlocal foldmethod=expr foldexpr=0
  autocmd FileType dbout,dbui autocmd BufEnter,WinEnter <buffer> stopinsert
augroup END
