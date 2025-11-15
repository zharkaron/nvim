-- lua/nvim/lint/config.lua
local lint = require("lint")

-- Define linters per filetype
lint.linters_by_ft = {
  python     = { "pylint" },      -- or flake8
  sh         = { "shellcheck" },
  bash       = { "shellcheck" },
  lua        = { "luacheck" },
  json       = { "jq"},
  javascript = { "eslint" },
  typescript = { "eslint" },
}

-- Auto-run lint on buffer events
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
