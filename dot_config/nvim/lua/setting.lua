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
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.cmd [[colorscheme tokyonight]]

if OS == 'Linux' and uname.release:lower() then
vim.cmd [[
  let g:clipboard = {
    \   'name': 'myClipboard',
    \   'copy': {
    \      '+': 'win32yank.exe -i',
    \      '*': 'win32yank.exe -i',
    \    },
    \   'paste': {
    \      '+': 'win32yank.exe -o',
    \      '*': 'win32yank.exe -o',
    \   },
    \   'cache_enabled': 1,
    \ }
]]
end



vim.api.nvim_create_augroup('imegroup', { clear = true })

function ime_leave()
  if vim.fn.has('linux') then
    if vim.fn.system('type ibus') ~= '' then
      vim.fn.system('ibus engine xkb:us::eng')
    end
  end
end

function ime_enter()
  if vim.fn.has('linux') then
    if vim.fn.system('type ibus') ~= '' then
      vim.fn.system('ibus engine mozc-jp')
    end
  end
end
vim.api.nvim_create_autocmd({'InsertLeave'},{
  pattern = '*',
  group='imegroup',
  callback=ime_leave,
})

vim.api.nvim_create_autocmd({'InsertEnter'},{
  pattern = '*',
  group='imegroup',
  callback=ime_enter,
})
