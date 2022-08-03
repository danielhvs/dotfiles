lua << EOF
  -- configure the litee.nvim library 
  require('litee.lib').setup({})
  -- configure litee-calltree.nvim
  require('litee.calltree').setup({
        on_open = "panel",
  })
EOF
