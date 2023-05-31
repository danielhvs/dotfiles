require('telescope').setup(
  {
    defaults =
    {
      path_display = { "smart" },
      initial_mode = "normal",
      prompt_prefix = "",
      file_ignore_patterns = { "node_modules", "DS_Store", "target" },
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      layout_config = {
        horizontal = { width = 0.95 },
        --preview_width = 0.65,
        vertical = { width = 0.95 }
      },
      wrap_results = false
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" } }
    }
  })
