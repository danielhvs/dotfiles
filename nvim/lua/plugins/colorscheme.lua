return {
  "gruvbox-community/gruvbox",
  name = "gruvbox",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "gruvbox"
    vim.g.gruvbox_contrast_dark = "hard"
  end

}
