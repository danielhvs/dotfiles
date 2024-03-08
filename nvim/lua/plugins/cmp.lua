return
{
  "hrsh7th/nvim-cmp",
  opts = {
    -- load cmp on InsertEnter
    event = "InsertEnter",
  },
  -- these dependencies will only be loaded when cmp loads
  -- dependencies are always lazy-loaded unless specified otherwise
  dependencies = {
    'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    "/hrsh7th/cmp-nvim-lsp-signature-help",
    'saadparwaiz1/cmp_luasnip',
    "rafamadriz/friendly-snippets"
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    local ls = require('luasnip')
    vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

    local cmp = require('cmp')

    -- `:` cmdline setup.
    -- FIXME bug with :! compleation
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' } }, { { name = 'cmdline', }
      })
    })

    return cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs((-4)),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
      },
      sources = cmp.config.sources(
        {
          { name = "nvim_lsp" },
          { name = 'nvim_lsp_signature_help' },
          { name = "path" },
          { name = "buffer" },
          { name = 'luasnip' },
          -- { name = "codeium" },
        })
    })
  end
}
