-- lua/treesitter/config.lua
require('nvim-treesitter.configs').setup({
    ensure_installed = { "lua", "python", "javascript", "typescript", "java", "html", "css" },
    highlight = { enable = true },
    indent = { enable = false },  -- disable Treesitter indentation
})
