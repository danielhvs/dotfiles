" if has('nvim-0.5')
"   augroup lsp
"     au!
"     au FileType java lua vim.lsp.buf_attach_client(0, 1)
"   augroup end
" endif
"

" augroup jdtls_lsp
"     autocmd!
"     au FileType java lua vim.lsp.buf_attach_client(0, 1)
" augroup end

augroup autoformat_settings
  autocmd FileType java set nosmarttab noexpandtab shiftwidth=2 tabstop=2
augroup END

" start lsp manually
" nnoremap <leader>lx :lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})<CR>
" nnoremap <leader>lX :lua vim.lsp.buf_attach_client(0, 1)<CR>

" java lsp
"  `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
"  use this mapping also with other language servers
nnoremap <leader>la :lua vim.lsp.buf.code_action()<CR>
vnoremap <leader>la :lua vim.lsp.buf.range_code_action()<CR>
" vnoremap <leader>la :lua require'jdtls'.code_action(true)<CR>
nnoremap <leader>lm :lua require'jdtls'.organize_imports()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR> 
nnoremap K :lua vim.lsp.buf.hover()<CR> 
nnoremap <leader>ld :lua vim.lsp.buf.declaration()<CR> 
nnoremap <leader>lt :lua vim.lsp.buf.type_definition()<CR> 
nnoremap <leader>lh :lua vim.lsp.buf.signature_help()<CR> 
nnoremap <leader>ln :lua vim.lsp.buf.rename()<CR> 
nnoremap <leader>lc :lua require'jdtls'.extract_constant()<CR>
vnoremap <leader>lc :lua require'jdtls'.extract_constant(true)<CR>
nnoremap <leader>le :lua require'jdtls'.extract_method()<CR>
vnoremap <leader>le :lua require'jdtls'.extract_method(true)<CR>
nnoremap <leader>lv :lua require'jdtls'.extract_variable()<CR>
vnoremap <leader>lv :lua require'jdtls'.extract_variable(true)<CR>
nnoremap <leader>lq :lua vim.lsp.diagnostic.set_loclist()<CR> 
nnoremap <leader>lF :lua vim.lsp.buf.formatting()<CR> 
nnoremap <leader>lf :!git diff -U0 HEAD\|google-java-format-diff.py -p1 -i<CR>
nnoremap <leader>lj :lua vim.lsp.diagnostic.goto_next()<CR> 
nnoremap <leader>lk :lua vim.lsp.diagnostic.goto_prev()<CR> 
nnoremap <leader>lw :lua require('telescope.builtin').lsp_workspace_diagnostics()<CR> 
nnoremap <leader>lr :lua require('telescope.builtin').lsp_references()<CR> 
nnoremap <leader>lR :lua require('daniel').custom_lsp_java_references()<CR> 
nnoremap <leader>lI :lua require('daniel').custom_lsp_implementations()<CR> 
nnoremap <leader>li :lua require('telescope.builtin').lsp_implementations()<CR> 
nnoremap <leader>lC :lua vim.lsp.buf.incoming_calls()<CR> 
nnoremap <leader>lK :lua vim.lsp.buf.outgoing_calls()<CR> 
" kill all lsp
nnoremap <leader>l! :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>

" java
nnoremap <leader>jl mmyiwoLOG.info("daniel <esc>pa = " + <esc>pa);<esc>=j`m
nnoremap <leader>jL mmyiWoLOG.info("daniel <esc>pa = " + <esc>pa);<esc>=j`m

nnoremap <leader>l? :LspInfo<CR>
