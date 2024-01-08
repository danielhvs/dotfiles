return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
  },
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]],
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    search = {
      pattern = [[\b(KEYWORDS)\b]],
    },
  }
}
