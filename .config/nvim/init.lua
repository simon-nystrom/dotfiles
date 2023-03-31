require('plugins-setup')
require('simon.options')
require('simon.keymaps')
require('simon.plugins.nvim-tree')
require('simon.plugins.lsp.lsp_general')
require('simon.plugins.lsp.lua')
require('simon.plugins.lsp.jsts')
require('simon.plugins.lsp.tailwind')
require('simon.plugins.lsp.elixir')


vim.o.completeopt = "menu,menuone,noselect"

vim.cmd [[colorscheme tokyonight-storm]]


require('lualine').setup {}
require('gitsigns').setup()

-- require 'lspconfig'.eslint.setup {}
-- require 'lspconfig'.tsserver.setup {}
require 'lspconfig'.pyright.setup {}


require 'nvim-treesitter.configs'.setup {
  -- a list of parser names, or "all"
  ensure_installed = { "javascript", "python", "lua", "elixir" },

  -- install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- automatically install missing parsers when entering buffer
  -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
  auto_install = true,

  -- list of parsers to ignore installing (for "all")
  ignore_install = {},

  ---- if you need to change the installation directory of the parsers (see -> advanced setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- note: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 kb
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    -- setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- using this option may slow down your editor, and you may see some duplicate highlights.
    -- instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}



require("neotest").setup({
  adapters = {
    require("neotest-elixir"),
    require("neotest-plenary"),
  },
})
