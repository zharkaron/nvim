local M = {}

function M.show()
  local filepath = vim.fn.stdpath("config") .. "/README.md"
  local content = vim.fn.readfile(filepath)

  -- Create buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Add README.md text
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

  -- Mark buffer as markdown
  vim.bo[buf].filetype = "markdown"

  -- Make buffer read-only
  vim.bo[buf].modifiable = false
  vim.bo[buf].readonly = true
  vim.bo[buf].buftype = "nofile"

  -- Floating window size
  local width  = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col    = math.floor((vim.o.columns - width) / 2)
  local row    = math.floor((vim.o.lines - height) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  })

  -- Optional: close help with "q"
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf })
end

return M
