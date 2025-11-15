-- lua/nvim-autopairs/keys.lua
local npairs = require('nvim-autopairs')

npairs.setup({
    fast_wrap = {
        map = "<M-e>",  -- Alt+e
        chars = {'(', '[', '{', '"', "'", "<"},
        keys = 'qwertyuiopasdfghjklzxcvbnm',
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    }
})

-- Optional: you can define custom keymaps if needed
-- e.g., disable auto-wrap in some filetypes or for special keys
