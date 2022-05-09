" LSP nativo inicio
if has('nvim-0.5')
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
  augroup end
endif

augroup autoformat_settings
  autocmd FileType java set nosmarttab noexpandtab shiftwidth=2 tabstop=2
augroup END

" java lsp
"  `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
"  use this mapping also with other language servers
nnoremap <leader>la :Telescope lsp_code_actions<CR>
" vnoremap <leader>la <Esc>:lua require('jdtls').code_action(true)<CR>?
nnoremap <leader>lm :lua require'jdtls'.organize_imports()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR> 
nnoremap K :lua vim.lsp.buf.hover()<CR> 
nnoremap <leader>ld :lua vim.lsp.buf.declaration()<CR> 
nnoremap <leader>lt :lua vim.lsp.buf.type_definition()<CR> 
nnoremap <leader>lh :lua vim.lsp.buf.signature_help()<CR> 
nnoremap <leader>ln :lua vim.lsp.buf.rename()<CR> 
nnoremap <leader>le :lua vim.lsp.diagnostic.show_line_diagnostics()<CR> 
nnoremap <leader>lq :lua vim.lsp.diagnostic.set_loclist()<CR> 
nnoremap <leader>lf :lua vim.lsp.buf.formatting()<CR> 
nnoremap <leader>lj :lua vim.lsp.diagnostic.goto_next()<CR> 
nnoremap <leader>lk :lua vim.lsp.diagnostic.goto_prev()<CR> 
nnoremap <leader>lw :lua require('telescope.builtin').lsp_workspace_diagnostics()<CR> 
nnoremap <leader>lr :lua require('telescope.builtin').lsp_references()<CR> 
nnoremap <leader>lR :lua require('daniel').custom_lsp_java_references()<CR> 
nnoremap <leader>lI :lua require('daniel').custom_lsp_implementations()<CR> 
nnoremap <leader>li :lua require('telescope.builtin').lsp_implementations()<CR> 

" java
nnoremap <leader>jo ciWLOG.error("daniel: ");<esc>2hi
nnoremap <leader>jO ^y$oLOG.error("daniel: <esc>pa");<esc>
nnoremap <leader>jl mmyiwoLOG.error("daniel: <esc>pa");<esc>`m
nnoremap <leader>jL mm^y$oLOG.error("daniel: <C-R>0");<esc>`m
nnoremap <leader>jp mmyiwoLOG.error("daniel: <esc>pa = " + <esc>pa);<esc>`m
nnoremap <leader>jP mmyiWoLOG.error("daniel: <esc>pa = " + <esc>pa);<esc>`m
