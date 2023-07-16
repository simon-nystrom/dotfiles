local capabilities = vim.lsp.protocol.make_client_capabilities()

require 'lspconfig'.elixirls.setup {
  cmd = { 'elixir-ls' },
  elixirLS = { dialyzerEnabled = true, fetchDeps = true, enableTestLenses = true },
  capabilities = capabilities
}
