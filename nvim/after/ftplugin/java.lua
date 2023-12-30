-- /home/danielhabib/bin/java-lsp.sh
-- LSP nativo inicio
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
  vim.fn.glob("/home/danielhabib/workspace/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1),
};

-- This is the new part
vim.list_extend(bundles, vim.split(vim.fn.glob("/home/danielhabib/workspace/vscode-java-test/server/*.jar", 1), "\n"))
--
-- function start_java() 
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
			'-data', '/home/danielhabib/workspace-nvim/spring/'
		},

		-- root_dir = require('jdtls.setup').find_root({
			-- '/home/danielhabib/workspace-nvim/eco/eco-comum/pom.xml',
			-- '/home/danielhabib/workspace-nvim/eco/eco-batch/pom.xml'
			-- }),
			root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),

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
          bundles = bundles;
				},
			}
			-- return config
		-- end

require('jdtls').start_or_attach(config)

require('jdtls.setup').add_commands()
