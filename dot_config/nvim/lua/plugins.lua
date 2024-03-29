local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "mfussenegger/nvim-dap"
  use "jose-elias-alvarez/null-ls.nvim"
  use "hrsh7th/nvim-cmp"

  use "hrsh7th/cmp-nvim-lsp"
  use "tpope/vim-fugitive"
  use "ibhagwan/fzf-lua"
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  }
  use "APZelos/blamer.nvim"
  use "simrat39/rust-tools.nvim"
  use "vim-test/vim-test"
  use {
    "akinsho/toggleterm.nvim",
    tag = "*"
  }
  use "tamago324/nlsp-settings.nvim"
  use "rcarriga/nvim-notify"
  use "folke/tokyonight.nvim"
  use { 'saadparwaiz1/cmp_luasnip' }
  use({
    "L3MON4D3/LuaSnip",
    tag = "v1.*",
  })
  use "rafamadriz/friendly-snippets"
  use "brooth/far.vim"
  use "hashivim/vim-terraform"
  use "simeji/winresizer"
  use {
    "airblade/vim-gitgutter",
    branch = "main"
  }
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
