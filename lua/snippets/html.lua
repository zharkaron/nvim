local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("html", {
    s("newfile", {
        t({"<!DOCTYPE html>", "<html lang=\"en\">", "<head>", "\t<meta charset=\"UTF-8\">", "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">", "\t<title>"}), i(1, "Document"), t({"</title>", "</head>", "<body>", "\t"}), i(2, ""), t({"", "</body>", "</html>"}), i(0)
    }),
})
