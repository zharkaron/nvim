local ls = require("luasnip")
require("snippets.bash")
require("snippets.html")
require("snippets.python")

-- Keymaps for expanding/jumping snippets safely
vim.keymap.set({"i", "s"}, "<Tab>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    else
        -- Fallback: insert a real Tab character
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
    end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<S-Tab>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true), "n", true)
    end
end, {silent = true})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.html",
    callback = function()
        local ls = require("luasnip")
        local snippets = require("luasnip").get_snippets("html")
        if snippets and #snippets > 0 then
            -- expand the first snippet (your template)
            ls.snip_expand(snippets[1])
        end
    end,
})


-- bash pre write
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.sh",
    callback = function()
        local ls = require("luasnip")
        local snippet = require("luasnip").get_snippets("sh")[1]  -- first snippet, your newfile snippet
        if snippet then
            ls.snip_expand(snippet)
        end
    end,
})

-- Auto-expand for Python files
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.py",
    callback = function()
        local ls = require("luasnip")
        local snippets = ls.get_snippets("python")
        if snippets and #snippets > 0 then
            ls.snip_expand(snippets[1])
        end
    end,
})
