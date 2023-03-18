require('plugins-setup')
require('simon.options')
require('simon.keymaps')
require('simon.plugins.nvim-tree-settings')

-- vim.lsp.set_log_level("debug")


vim.o.completeopt = "menu,menuone,noselect"

vim.cmd [[colorscheme tokyonight-storm]]


--vim.keymap.set('n', ':NvimTreeToggle<CR>', opts)

-- require('after.plugin.fzf')
require('lualine').setup {}

--local capabilities = require('cmp_nvim_lsp').default_capabilities()
local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(_, bufnr)
  -- enable completion triggered by <c-x><c-o>
                  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings.
  -- see `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  --  vim.keymap.set('n', '<space>d', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require 'lspconfig'.eslint.setup {}
require 'lspconfig'.elixirls.setup {
  cmd = { 'elixir-ls' },
  elixirLS = { dialyzerEnabled = true, fetchDeps = false },
  on_attach = on_attach,
  capabilities = capabilities
}
-- require'lspconfig'.elixirls.setup( coq.lsp_ensure_capabilities( {cmd = { "/opt/elixir/elixir-ls/language_server.sh" }} ))
-- require'lspconfig'.tsserver.setup{}
require 'nvim-treesitter.configs'.setup {
  -- a list of parser names, or "all"
  ensure_installed = { "javascript", "python", "lua" },

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

vim.api.nvim_create_autocmd({ 'bufwritepre' },
  { pattern = { '*.tsx,*.ts,*.jsx,*.js' }, callback = function() vim.cmd('EslintFixAll') end })
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = require("nvim-tree.api").tree.open })

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*.lua' },
  callback = function()
    vim.lsp.buf.format { async = true }
  end
})

require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
