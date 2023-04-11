require('plugins-setup')
require('simon.options')
require('simon.keymaps')
require('simon.plugins.nvim-tree')
require('simon.plugins.lsp.lsp_general')
require('simon.plugins.lsp.lua')
require('simon.plugins.lsp.jsts')
require('simon.plugins.lsp.tailwind')
require('simon.plugins.lsp.elixir')

vim.o.completeopt = "menu,menuone"

vim.cmd [[colorscheme tokyonight-storm]]

require('lualine').setup {}
require('gitsigns').setup()

require 'lspconfig'.pyright.setup {}

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "python", "lua", "elixir" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 kb
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
}


require("neotest").setup({
  quickfix = {
    open = false
  },
  adapters = {
    require("neotest-elixir"),
    require("neotest-plenary"),
  },
})
