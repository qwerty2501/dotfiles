local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "jose-elias-alvarez/null-ls.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "tpope/vim-fugitive",
    "ibhagwan/fzf-lua",
    {
      "nvim-tree/nvim-tree.lua",
      opts={},
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
    },
    "APZelos/blamer.nvim",
    "vim-test/vim-test",
    {"akinsho/toggleterm.nvim", version = "*", config = true},
    "tamago324/nlsp-settings.nvim",
    "rcarriga/nvim-notify",
    "folke/tokyonight.nvim",
    "saadparwaiz1/cmp_luasnip",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
    },
    "rafamadriz/friendly-snippets",
    "brooth/far.vim",
    "hashivim/vim-terraform",
    "simeji/winresizer",
    {
      "airblade/vim-gitgutter",
      branch = "main"
    },
    {
      "folke/trouble.nvim",
      opts = {
        warn_no_results = false,
      },
      command="Trouble",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
      },
    },
    {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    },
    {
      "mrcjkb/rustaceanvim",
      version = "^6",
      lazy = false,
    },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
