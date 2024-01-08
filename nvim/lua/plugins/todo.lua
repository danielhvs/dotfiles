return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
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
