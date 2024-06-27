require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = "./my_snippets" })
require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.getcwd() .. "/.my_snippets" })
