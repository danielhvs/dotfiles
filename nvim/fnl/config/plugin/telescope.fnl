(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             telescope telescope}})

(telescope.setup {:defaults {:path_display ["smart"]
                             :initial_mode "normal"
                             :prompt_prefix ""
                             :file_ignore_patterns ["node_modules" 
                                                    "DS_Store" 
                                                    "eco-docs" 
                                                    "target" 
                                                    "log"]
                             :borderchars [ "─" "│" "─" "│" "┌" "┐" "┘" "└"]
                             :layout_config {:preview_width 60
                                             :horizontal {:width 0.95}
                                             :vertical {:width 0.95}}}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})

(nvim.set_keymap :n :<leader>tb ":lua require('telescope.builtin').git_branches()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>tc ":lua require('telescope.builtin').git_commits()<CR>" {:noremap true})
