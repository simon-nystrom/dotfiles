vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly'                  -- optional, updated every week. (see issue #1193)
  }

  --  use({ "mhanberg/elixir.nvim", requires = { "nvim-lua/plenary.nvim" }})
  --
  --
  use {
    'lewis6991/gitsigns.nvim' }

  use {
    "nvim-neotest/neotest",
    requires = {
      "jfpedroza/neotest-elixir",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-plenary"
    }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'hsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'


  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  local cmp = require 'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<CR>']  = cmp.mapping.confirm({ select = true }),
      ['<C-b>'] = cmp.mapping.complete()
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = "buffer" },
    })
  })


  vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    pattern = { '*.ex,*.exs' },
    callback = function()
      vim.lsp.buf.format()
    end
  })
end)
