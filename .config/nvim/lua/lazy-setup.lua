local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  "tpope/vim-commentary",
  "tpope/vim-surround",

  "jose-elias-alvarez/null-ls.nvim",

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", version = false },
  "neovim/nvim-lspconfig",

  "lewis6991/gitsigns.nvim",

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- { "folke/noice.nvim",                dependencies = { "MunifTanjim/nui.nvim" } },
  { "nvim-tree/nvim-web-devicons",     lazy = true },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    tag = "nightly",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  "nvim-lualine/lualine.nvim",

  "echasnovski/mini.jump2d",
  "echasnovski/mini.pairs",
})
