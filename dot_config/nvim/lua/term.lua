vim.api.nvim_create_user_command("T", "split | wincmd j | resize 20 | terminal <args>", {})
vim.api.nvim_set_keymap("t", "<C-q>", "<C-\\><C-n>", {})
vim.cmd [[
    autocmd TermOpen * startinsert
]]
