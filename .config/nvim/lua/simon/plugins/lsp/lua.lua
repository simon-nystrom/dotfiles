require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*.lua' },
  callback = function()
    vim.lsp.buf.format {}
  end
})
