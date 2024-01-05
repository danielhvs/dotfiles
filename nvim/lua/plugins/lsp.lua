return {
  'neovim/nvim-lspconfig',
  config = function()
    local function clj_command(command_name)
      local params = {
        command = command_name,
        arguments = {
          "file://" .. (vim.fn.expand "%:p"),
          vim.fn.line "." - 1,
          vim.fn.col "." - 1 },
      }
      vim.lsp.buf.execute_command(params)
    end


    local lsp = require('lspconfig')
    local cmplsp = require('cmp_nvim_lsp')

    local the_capabilities = cmplsp.default_capabilities();

    vim.keymap.set('n', '<leader>l?', ':LspInfo<CR>', { noremap = true });

    local setup_mappings = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      local function key_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      key_map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
      key_map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
      key_map("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true })
      key_map("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true })
      key_map("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
      vim.keymap.set("n", "<localleader>r.", function() clj_command("thread-first-all") end, { noremap = true })
      vim.keymap.set("n", "<localleader>r>", function() clj_command("thread-last-all") end, { noremap = true })
      vim.keymap.set("n", "<localleader>ri", function() clj_command("inline-symbol") end, { noremap = true })
      vim.keymap.set("n", "<localleader>rn", function() clj_command("clean-ns") end, { noremap = true })
      vim.keymap.set("n", "<localleader>ru", function() clj_command("unwind-thread") end, { noremap = true })
      vim.keymap.set("n", "<localleader>rU", function() clj_command("unwind-all") end, { noremap = true })
      key_map("n", "<leader>lq", "<cmd>lua vim.diagnostic.set_loclist()<CR>", { noremap = true })
      key_map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true })
      key_map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true })
      key_map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
      key_map("v", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
      key_map("n", "<leader>lw", ":lua require('telescope.builtin').diagnostics()<cr>", { noremap = true })
      key_map("n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", { noremap = true })
      key_map("n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", { noremap = true })
      -- outline
      key_map("n", "<leader>lO", ":Telescope lsp_document_symbols<CR>", { noremap = true })
      key_map("n", "<leader>lK", ":lua vim.lsp.buf.outgoing_calls()<CR>", { noremap = true })
      key_map("n", "<leader>lC", ":lua vim.lsp.buf.incoming_calls()<CR>", { noremap = true })

      vim.keymap.set('n', '<leader>lf', function()
        vim.lsp.buf.format { async = true }
      end, bufopts)
    end

    local border = 'single'

    vim.diagnostic.config {
      float = { border = border }
    }

    local the_handlers = {
      ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
        {
          severity_sort = false,
          update_in_insert = false,
          underline = true,
          virtual_text = true
        }),
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
    }

    lsp.lua_ls.setup {
      handlers = the_handlers,
      on_attach = setup_mappings,
      capabilities = the_capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
        },
      }
    }

    lsp.clojure_lsp.setup({
      -- the below is  for developing clojure-lsp
      -- cmd = { '/home/danielhabib/workspace/clojure-lsp/clojure-lsp' },
      on_attach = setup_mappings,
      handlers = the_handlers,
      capabilities = the_capabilities,
    })

    -- TODO moar config?
    lsp.tsserver.setup {
      on_attach = setup_mappings,
      capabilities = the_capabilities,
    }
  end
}
