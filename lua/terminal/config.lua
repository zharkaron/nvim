require("toggleterm").setup({
  size = 20,
  open_mapping = [[<leader>tt]],  -- leader+tt to toggle terminal
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  direction = "horizontal",       -- or "float"
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  close_on_exit = false,           -- prevent auto-close on exit
})
