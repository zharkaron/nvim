-- lua/plugins.lua
return {
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    },

    -- Nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- autopairs
    {
      "windwp/nvim-autopairs",
      config = function()
        require("autopairs.config")
      end
    },

    -- autotag
    {
    "windwp/nvim-ts-autotag",
    config = function()
        require('nvim-ts-autotag').setup()
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" }
    },

    -- LuaSnip
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("snippets.config")
        end
    },

    -- lint
    {
      "mfussenegger/nvim-lint",
      config = function()
        require("lint.config")
      end,
    },

    -- Copilot
    {
      "github/copilot.vim",
      config = function() require("copilot.config") end,
    },

    -- Copilot Chat
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = { "github/copilot.vim", "nvim-lua/plenary.nvim"},
      config = function() require("copilotchat.config") end,
    },

    -- ToggleTerm
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = function()
        require("terminal.config")
      end,
    },

    -- Telescope
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope.setup")
      end,
    },
        -- Render Markdown
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown" },
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("render-markdown").setup({})
      end,
    },

    -- Colorscheme
    { "morhetz/gruvbox" },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
}
