-- lua/nvim/style.lua
vim.cmd([[colorscheme gruvbox]])

-- Optional statusline
require("lualine").setup({
    options = { theme = "gruvbox" }
})
