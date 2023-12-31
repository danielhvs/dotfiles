return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd [[
    colorscheme tokyonight-night
    " colorscheme tokyonight-night
    " colorscheme tokyonight-storm
    " colorscheme tokyonight-day
    " colorscheme tokyonight-moon
    ]]
  end
}
