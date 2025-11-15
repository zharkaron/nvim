-- lua/nvim/lint/style.lua

-- Show lint messages inline like VSCode
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",       -- could be '■', '→', etc.
    spacing = 2,
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = true,         -- show gutter signs
  underline = true,     -- underline offending code
  update_in_insert = false,
  severity_sort = true,
})
