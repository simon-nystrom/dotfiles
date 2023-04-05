-- Configuration for JavaScript and TypeScript


require 'lspconfig'.eslint.setup { capabilities = LSP_CAPABILITIES }
require 'lspconfig'.tsserver.setup { capabilities = LSP_CAPABILITIES, handlers = LSP_HANDLERS }

vim.api.nvim_create_autocmd({ 'bufwritepre' },
  {
    pattern = { '*.tsx,*.ts,*.jsx,*.js' },
    callback = function()
      vim.cmd('EslintFixAll')
      vim.lsp.buf.format()
    end
  })
