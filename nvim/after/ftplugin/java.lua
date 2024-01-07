-- LSP nativo inicio
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
  vim.fn.glob(
    "/home/danielhabib/workspace/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
    1),
};

-- This is the new part
vim.list_extend(bundles, vim.split(vim.fn.glob("/home/danielhabib/workspace/vscode-java-test/server/*.jar", 1), "\n"))
--
-- function start_java()
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/danielhabib/workspace-nvim/lsp/' .. project_name
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  -- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
  -- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  -- local workspace_dir = '/path/to/workspace-root/' .. project_name
  -- 'data', workspace_dir
  cmd = {
    '/home/danielhabib/dev/jdk/jdk-17.0.7/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '-javaagent:/home/danielhabib/.local/share/nvim/lspinstall/java/lombok.jar',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', '/home/danielhabib/dev/eclipse-jdt-ls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/home/danielhabib/dev/eclipse-jdt-ls/config_linux/',
    '-data', workspace_dir
  },

  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),

  settings = {
    java = {
      configuration = {
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- And search for `interface RuntimeOption`
        -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
        runtimes = {
          {
            name = "JavaSE-11",
            path = "/home/danielhabib/dev/jdk/jdk-17.0.7",
          },
          -- {
          -- 	name = "JavaSE-8",
          -- 	path = "/usr/lib/jvm/java-8-openjdk-amd64",
          -- },
        }
      }
      -- filteredTypes = {
      --   "com.sun.*",
      --   "java.awt.*",
      --   "jdk.*",
      --   "sun.*",
      -- },
    }
  },

  init_options = {
    bundles = bundles,
  },
}
-- return config
-- end

require('jdtls').start_or_attach(config)

require('lsp_mappings')(0, 0)

vim.cmd [[
" api
nnoremap <localleader>ga yiw:!tmux send-keys -t eco:gapi ",tpp"<CR> :!tmux select-window -t 1<CR>
nnoremap <localleader>gA yiW:!tmux send-keys -t eco:gapi ",tpp"<CR> :!tmux select-window -t 1<CR>
" conflita com coiso `oil`
nnoremap <localleader>fa yiw:!tmux send-keys -t eco:gapi ",pp"<CR> :!tmux select-window -t 1<CR>
nnoremap <localleader>Fa yiW:!tmux send-keys -t eco:gapi ",pp"<CR> :!tmux select-window -t 1<CR>

" comum
nnoremap <localleader>gc yiw:!tmux send-keys -t eco:comum ",tpp"<CR> :!tmux select-window -t 3<CR>
nnoremap <localleader>gC yiW:!tmux send-keys -t eco:comum ",tpp"<CR> :!tmux select-window -t 3<CR>
nnoremap <localleader>fc yiw:!tmux send-keys -t eco:comum ",pp"<CR> :!tmux select-window -t 3<CR>
nnoremap <localleader>Fc yiW:!tmux send-keys -t eco:comum ",pp"<CR> :!tmux select-window -t 3<CR>

" nnoremap <localleader>l :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>:e<CR>
nnoremap <localleader>l :JdtUpdateConfig<CR>:lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
nnoremap <localleader>L :silent !limpa-lsp.sh<CR>:JdtUpdateConfig<CR>:JdtRestart<CR>

nnoremap <localleader>rt mm?@Test<CR>/void<CR>W"yyiw/^public.*\(class\\|interface\\|enum\)<CR>WW"cyiw`m:terminal mvn surefire:test -Dtest=<C-R>c\#<C-R>y<CR><CR><C-O>
nnoremap <localleader>rT mm?@Test<CR>jWW"yyiw/^public.*\(class\\|interface\\|enum\)<CR>WW"cyiw`m:terminal mvn surefire:test -Dtest=<C-R>c<CR>
nnoremap <localleader>T :silent !sh /home/danielhabib/dtp/nvim/test.sh<CR>

" typescript
nnoremap <leader>jt mm"yyiwoconsole.log(":debug <C-R>y = ", <C-R>y);<esc>=j`m
nnoremap <leader>jT mm"yyiwoconsole.log(":debug <C-R>y");<esc>=j`m

" tmux jshell wuuut
" eval buffer
nnoremap <localleader>eb :silent !sed '0,/package/s//import/' % \| sed '0,/;/s//\.\*;/' > /tmp/lol.java<CR>:silent !tmux send-keys -t 2 "/open /tmp/lol.java" ENTER<CR>

" eval line
nnoremap <localleader>ew V:s/"/\\"/ge<CR>V:s/;/\\;/ge<CR>"jyy:silent !tmux send-keys -t 2 "<C-R>j" ENTER<CR>:!tmux select-window -t 2<CR>
" eval line but don't switch windows
nnoremap <localleader>ee V:s/"/\\"/ge<CR>V:s/;/\\;/ge<CR>"jyy:silent !tmux send-keys -t 2 "<C-R>j" ENTER<CR>

" dont save the buffer
nnoremap <localleader>e! :e!<CR>
]]

vim.cmd [[
augroup autoformat_settings
  autocmd FileType java set shiftwidth=4 tabstop=4
augroup END
]]


vim.cmd [[

" FIXME:
" vnoremap <leader>la :lua require'jdtls'.code_action(true)<CR>
nnoremap <leader>lm :lua require'jdtls'.organize_imports()<CR>
nnoremap <leader>ld :lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>lt :lua require'jdtls'.test_nearest_method()<CR>
nnoremap <leader>lh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>le :lua require'jdtls'.extract_method()<CR>
vnoremap <leader>le :lua require'jdtls'.extract_method(true)<CR>
nnoremap <leader>lv :lua require'jdtls'.extract_variable()<CR>
vnoremap <leader>lv :lua require'jdtls'.extract_variable(true)<CR>
nmap <leader>ls mmvap,lf<ESC>'m
" kill all lsp
nnoremap <leader>l! :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>

" java
nnoremap <leader>jl mmyiwoLOG.info(":debug <esc>pa = ", <esc>pa);<esc>=j`m
nnoremap <leader>jL mmyiwoLOG.info(":debug <esc>pa ");<esc>F"i
nnoremap <leader>jL mmyiwoLOG.info(":debug <esc>pa ");<esc>F"i
nmap <leader>jk mm,fc"cyiw}aprivate static final LoggerFactory LOG = LoggerFactory.getInstance(<C-R>c.class.toString());<ESC>ggoimport br.gov.dataprev.infra.core.util.io.LoggerFactory;<ESC>`mzz

" jumps
nnoremap <leader>fc /^public.*\(class\\|interface\\|enum\)<CR>z<CR>/[A-Z]<CR>

" copia metodo
nnoremap <leader>sm mm0f(b"wyiw<CR>G/public.*\(class\\|interface\\|enum\)<CR>z<CR>/[A-Z]<CR>yiwo<ESC>P0~A.<ESC>"wp0<ESC>dd`m:update<CR>

map <localleader>w csw)i
map <localleader>> mmcsw>iList<ESC>`m
map <leader>> mmcsw>`m

" test
nnoremap <localleader>rt mm?@Test<CR>/void<CR>W"yyiw/^public.*\(class\\|interface\\|enum\)<CR>WW"cyiw`m:terminal mvn surefire:test -Dtest=<C-R>c\#<C-R>y<CR><CR><C-O>

]]

-- refactor inline
vim.keymap.set('n', '<leader>lI', function()
  vim.lsp.buf.code_action {
    context = { only = { "refactor.inline" } },
    filter = function(action) return true end,
    apply = true,
  }
end, {})
