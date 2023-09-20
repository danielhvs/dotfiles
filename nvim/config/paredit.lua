paredit = require("nvim-paredit")
paredit.setup({
  -- should plugin use default keybindings? (default = true)
  use_default_keys = true,
  -- sometimes user wants to restrict plugin to certain file types only
  -- defaults to all supported file types including custom lang
  -- extensions (see next section)
  filetypes = { "clojure" },

  -- This controls where the cursor is placed when performing slurp/barf operations
  --
  -- - "remain" - It will never change the cursor position, keeping it in the same place
  -- - "follow" - It will always place the cursor on the form edge that was moved
  -- - "auto"   - A combination of remain and follow, it will try keep the cursor in the original position
  --              unless doing so would result in the cursor no longer being within the original form. In
  --              this case it will place the cursor on the moved edge
  cursor_behaviour = "auto", -- remain, follow, auto

  indent = {
    -- This controls how nvim-paredit handles indentation when performing operations which
    -- should change the indentation of the form (such as when slurping or barfing).
    --
    -- When set to true then it will attempt to fix the indentation of nodes operated on.
    enabled = true,
    -- A function that will be called after a slurp/barf if you want to provide a custom indentation
    -- implementation.
    indentor = require("nvim-paredit.indentation.native").indentor,
  },

  -- list of default keybindings
  keys = {
    ["<M-S-l>"] = { paredit.api.slurp_forwards, "Slurp forwards" },
    ["<M-S-h>"] = { paredit.api.slurp_backwards, "Slurp backwards" },

    ["<M-S-k>"] = { paredit.api.barf_forwards, "Barf forwards" },
    ["<M-S-j>"] = { paredit.api.barf_backwards, "Barf backwards" },

    ["<M-C-l>"] = { paredit.api.drag_element_forwards, "Drag element right" },
    ["<M-C-h>"] = { paredit.api.drag_element_backwards, "Drag element left" },

    ["<M-l>"] = { paredit.api.drag_form_forwards, "Drag form right" },
    ["<M-h>"] = { paredit.api.drag_form_backwards, "Drag form left" },

    ["<localleader>o"] = { paredit.api.raise_form, "Raise form" },
    ["<localleader>O"] = { paredit.api.raise_element, "Raise element" },

    ["W"] = {
      paredit.api.move_to_next_element,
      "Jump to next element tail",
      -- by default all keybindings are dot repeatable
      repeatable = false,
      mode = { "n", "x", "o", "v" },
    },
    ["B"] = {
      paredit.api.move_to_prev_element,
      "Jump to previous element head",
      repeatable = false,
      mode = { "n", "x", "o", "v" },
    },

    -- These are text object selection keybindings which can used with standard `d, y, c`, `v`
    ["af"] = {
      paredit.api.select_around_form,
      "Around form",
      repeatable = false,
      mode = { "o", "v" }
    },
    ["if"] = {
      paredit.api.select_in_form,
      "In form",
      repeatable = false,
      mode = { "o", "v" }
    },
    ["ae"] = {
      paredit.api.select_element,
      "Around element",
      repeatable = false,
      mode = { "o", "v" },
    },
    ["ie"] = {
      paredit.api.select_element,
      "Element",
      repeatable = false,
      mode = { "o", "v" },
    },
  }
})
