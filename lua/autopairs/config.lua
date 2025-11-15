-- lua/nvim-autopairs/config.lua
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    check_ts = true,                 -- Treesitter-aware pairs
    enable_moveright = true,         -- jump over existing closing bracket
    enable_check_bracket_line = true,
    ignored_next_char = "[%w%.]",    -- ignore letters/dots after cursor
    disable_filetype = { "TelescopePrompt", "vim" }, -- optional: disable in some filetypes
})

-- HTML: automatically close tags
npairs.add_rules({
    Rule("<", ">", "html")
        :with_pair(function(opts)
            return opts.char == "<"
        end),
    -- JSX / TSX self-closing tags
    Rule("<", "/>", "typescriptreact")
})

-- Optional: add more language-specific rules here
