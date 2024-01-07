return {
  'neovim/nvim-lspconfig',
  dependencies = { "folke/neodev.nvim" },

  config = function()
    -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
    require("neodev").setup({})

    local lsp = require('lspconfig')
    local cmplsp = require('cmp_nvim_lsp')

    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "H", texthl = "DiagnosticSignHint" })

    vim.keymap.set('n', '<leader>l?', ':LspInfo<CR>', { noremap = true });

    local the_capabilities = cmplsp.default_capabilities();
    local setup_mappings = require('lsp_mappings')
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

    lsp.tsserver.setup {
      on_attach = setup_mappings,
      capabilities = the_capabilities,
    }
  end
}
