" /home/danielhabib/bin/java-lsp.sh
" LSP nativo inicio
lua << EOF

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
function ccc() 
  local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
      'java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-jar', '/home/danielhabib/dev/eclipse-jdt-ls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
      '-configuration', '/home/danielhabib/dev/eclipse-jdt-ls/config_linux/',
      '-data', '/home/danielhabib/workspace-nvim/eco/'
    },

    root_dir = require('jdtls.setup').find_root({
    '/home/danielhabib/workspace-nvim/eco/eco-comum/pom.xml',
    '/home/danielhabib/workspace-nvim/eco/eco-batch/pom.xml'
    }),

    settings = {
      java = {
      }
    },

    init_options = {
      bundles = {}
    },
  }
  return config
end

local attach = function() require('jdtls').start_or_attach(ccc()) end

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.java"},
	callback = attach,
})

EOF

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
" nnoremap <leader>lR :lua vim.lsp.buf.incoming_calls()<CR> 
nnoremap <leader>lO :lua vim.lsp.buf.outgoing_calls()<CR> 
" kill all lsp
nnoremap <leader>l! :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>

" java
" nnoremap <leader>jl mmyiwoSystem.out.println("daniel: <esc>pa = " + <esc>pa);<esc>`m
" nnoremap <leader>jL mmyiWoSystem.out.println("daniel: <esc>pa = " + <esc>pa);<esc>`m


nnoremap <leader>jl mmyiwoLOG.info("<esc>pa = " + <esc>pa);<esc>`m
nnoremap <leader>jL mmyiWoLOG.info("<esc>pa = " + <esc>pa);<esc>`m

