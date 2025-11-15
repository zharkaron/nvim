-- lua/snippets/bash.lua
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node


-- Boilerplate snippet for new Bash files
ls.add_snippets("sh", {
    s("newfile", {  -- trigger word, can be anything
        t({"#!/bin/bash", ""}),  -- the first line
        t({"# Author: "}), i(1, "Your Name"), t({""}),
        t({"# Description: "}), i(2, "Description here"), t({""}),
        t({"", ""}),
        i(0)  -- cursor ends here
    }),
})

-- Bash snippets
ls.add_snippets("sh", {
    s("if", {
        t("if "), i(1, "<condition>"), t(" ; then"),
        t({"", "\t"}), i(2),
        t({"", "fi"})
    }),
    s("for", {
        t("for "), i(1, "i in ..."), t(" ; do"),
        t({"", "\t"}), i(2),
        t({"", "done"})
    }),
    s("while", {
        t("while "), i(1, "<condition>"), t(" ; do"),
        t({"", "\t"}), i(2),
        t({"", "done"})
    }),
    s("case", {
        t("case "), i(1, "<value>"), t(" in"),
        t({"", "\t"}), i(2, "# pattern"),
        t({"", "esac"})
    }),
})
