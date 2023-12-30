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
    'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-cmdline'
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' } }, { { name = 'cmdline', }
      })
    })

    return cmp.setup({
      mapping = {
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
          { name = "path" },
          { name = "buffer" },
        })
    })
  end
}
