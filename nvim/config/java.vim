augroup autoformat_settings
  autocmd FileType java set nosmarttab noexpandtab shiftwidth=2 tabstop=2
augroup END

" java
nnoremap <leader>jo ciWLOG.error("daniel: ");<esc>2hi
nnoremap <leader>jO ^y$oLOG.error("daniel: <esc>pa");<esc>
nnoremap <leader>jl mmyiwoSystem.out.println("daniel: <esc>pa");<esc>`m
nnoremap <leader>jL mmyiWoSystem.out.println("daniel: <esc>pa");<esc>`m

