local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- New Python file boilerplate
ls.add_snippets("python", {
    s("newfile", {
        t({"#!/usr/bin/env python3", "", "# Author: "}), i(1, "Your Name"), t({"", "# Description: "}), i(2, "Description here"), t({"", "", ""}),
        i(0)  -- cursor ends here
    }),
})

-- __Main__ snippet
ls.add_snippets("python", {
  ls.parser.parse_snippet("main", 'if __name__ == "__main__":\n\t${1:main()}'),
  ls.parser.parse_snippet("print", 'print(${1:"Hello, world!"})'),
})
