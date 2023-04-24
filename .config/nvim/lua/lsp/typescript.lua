-- require("lspconfig").eslint.setup({
--   capabilities = LSP_CAPABILITIES,
-- on_attach = function(client, bufnr)
--   vim.api.nvim_create_autocmd("BufWritePre", {
--     buffer = bufnr,
--     command = "EslintFixAll",
--   })
-- end,
-- })
require("lspconfig").tsserver.setup({
  capabilities = LSP_CAPABILITIES,
  handlers = LSP_HANDLERS,
})
