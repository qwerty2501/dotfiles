vim.g.mapleader = " "

local default_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>t", "<cmd>TestNearest<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>T", "<cmd>TestFile<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>TestSuite<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>l", "<cmd>TestLast<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>g", "<cmd>TestVisit<CR>", default_opts)



vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")


vim.api.nvim_set_keymap("n", "<Leader>n", "<cmd>NvimTreeToggle<CR>", default_opts)


vim.api.nvim_set_keymap("n", "<Leader>[", "<cmd>ToggleTerm<CR>", default_opts)
vim.api.nvim_set_keymap("t", "<C-q>", [[<C-\><C-n>]], default_opts)
vim.api.nvim_set_keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], default_opts)
vim.api.nvim_set_keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], default_opts)
vim.api.nvim_set_keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], default_opts)
vim.api.nvim_set_keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], default_opts)


vim.api.nvim_set_keymap("n", "<Leader>xx", "<cmd>TroubleToggle<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>xq", "<cmd>TroubleToggle quickfix<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>xl", "<cmd>TroubleToggle loclist<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>xn", "<cmd>Trouble<CR><cmd>lua require(\"trouble\").next({skip_groups = true, jump = true})<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>xp", "<cmd>Trouble<CR><cmd>lua require(\"trouble\").previous({skip_groups = true, jump = true})<CR>", default_opts)

