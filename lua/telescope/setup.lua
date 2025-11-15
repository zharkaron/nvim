local telescope = require("telescope")

telescope.setup({
  defaults = {
    prompt_prefix = "  ",
    selection_caret = " ",
    layout_strategy = "flex",
    layout_config = {
      horizontal = { preview_width = 0.6 },
      vertical = { mirror = false },
    },
    sorting_strategy = "ascending",
    winblend = 5,
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

require("telescope.keys")
require("telescope.style")
