-- init.lua
-- init.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  -- clone lazy.nvim if it doesn't exist
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- now load your plugins
require("lazy").setup("plugins") -- adjust path if your plugins.lua is elsewhere

-- Load core Neovim configuration
require("nvim.config")
require("nvim.style")
require("nvim.keys")

-- Load plugin-specific modular configs

-- treesitter
require("treesitter.config")
require("treesitter.style")
require("treesitter.keys")


-- nvimtree
require("nvimtree.config")
require("nvimtree.style")
require("nvimtree.keys")

-- autopairs
require("autopairs.config")
require("autopairs.style")
require("autopairs.keys")

-- Snippets
require("snippets.config")

-- lint
require("lint.config")
require("lint.style")
require("lint.keys")

-- Copilot
require("copilot.config")
require("copilot.style")
require("copilot.keys")

-- CopilotChat
require("copilotchat.config")
require("copilotchat.style")
require("copilotchat.keys")

-- terminal
require("terminal.config")
require("terminal.style")
require("terminal.keys")

-- telescope
require("telescope.setup")

-- Help list
require("help.config")

vim.api.nvim_create_user_command("MyHelp", function()
  require("help.config").show()
end, {})
