vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.whichwrap = "b,s,[,],<,>"
vim.opt.backspace = "indent,eol,start"
vim.opt.ambiwidth = "single"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.backup = true
vim.opt.expandtab = true
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backup"
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%"
vim.opt.statusline = "%<%f\\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\\ %P"
vim.opt.wrap = false
vim.opt.nrformats = "bin,hex"
vim.opt.swapfile = false
vim.opt.formatoptions:remove("t")
vim.opt.formatoptions:append("mM")


vim.cmd [[
 let s:on_microsoft=system('uname -a | grep -i microsoft') != "" 
 if s:on_microsoft
    augroup myYank
        autocmd!
        autocmd TextYankPost * :call system('clip.exe', @")
    augroup END
 endif
]]
