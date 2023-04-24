require("lspconfig").elixirls.setup({
  cmd = { "elixir-ls" },
  elixirLS = { dialyzerEnabled = true, fetchDeps = true, enableTestLenses = true },
  capabilities = LSP_CAPABILITIES,
})
