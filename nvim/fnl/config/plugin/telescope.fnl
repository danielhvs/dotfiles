(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             telescope telescope}})

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules" 
                                                    "DS_Store" 
                                                    "git" 
                                                    "eco-docs" 
                                                    "target" 
                                                    "log"]
                             :borderchars [ "─" "│" "─" "│" "╭" "╮" "╯" "╰"]
                             :layout_config {:horizontal {:width 0.95}
                                             :vertical {:width 0.95}}}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})

(nvim.set_keymap :n :<leader>p ":lua require('telescope.builtin').find_files()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>tg ":lua require('telescope.builtin').live_grep()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>o ":lua require('telescope.builtin').buffers()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>th ":lua require('telescope.builtin').help_tags()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>tc ":lua require('telescope.builtin').git_commits()<CR>" {:noremap true})
