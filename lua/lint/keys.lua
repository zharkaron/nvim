-- lua/nvim/lint/keys.lua
local lint = require("lint")

-- Keymap to manually run linting
vim.keymap.set("n", "<leader>l", function()
  lint.try_lint()
  vim.notify("Linting done for current buffer", vim.log.levels.INFO)
end, { desc = "Run linter for current file" })

-- Optional: jump to next/previous lint warning
vim.keymap.set("n", "]l", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Next lint warning" })
vim.keymap.set("n", "[l", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Previous lint warning" })
