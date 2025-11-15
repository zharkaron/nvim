-- lua/copilot/keys.lua

-- Accept suggestion in insert mode
vim.api.nvim_set_keymap("i", "<C-e>", 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })

-- Enable/disable Copilot
vim.api.nvim_set_keymap("n", "<C-e>", ":Copilot enable<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", ":Copilot disable<CR>", { noremap = true, silent = true })
