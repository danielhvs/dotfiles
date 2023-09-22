require 'nvim-treesitter.configs'.setup {
  ensure_installed =  { "make", "typescript", "javascript", "c", "lua", "vim", "vimdoc", "sql", "clojure", "java", "json", "json5", "make", "bash" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false, -- may slow down but fixes keyword highlight
  },

  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>mp"] = "@parameter.inner",
        ["<leader>mb"] = "@block.outer",
        ["<leader>mc"] = "@conditional.outer",
      },
      swap_previous = {
        ["<leader>mP"] = "@parameter.inner",
        ["<leader>mB"] = "@block.outer",
        ["<leader>mC"] = "@conditional.outer",
      },
    },
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["aP"] = "@parameter.outer",
        ["iP"] = "@parameter.inner",
      },
    },

    move = {
      enable = true,
      set_jumps = true,   -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
      },
    },

  },
}
