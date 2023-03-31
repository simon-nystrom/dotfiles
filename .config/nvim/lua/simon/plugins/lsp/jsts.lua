-- Configuration for JavaScript and TypeScript

require 'lspconfig'.eslint.setup {}
require 'lspconfig'.tsserver.setup {}

vim.api.nvim_create_autocmd({ 'bufwritepre' },
  {
    pattern = { '*.tsx,*.ts,*.jsx,*.js' },
    callback = function()
      vim.cmd('EslintFixAll')
      vim.lsp.buf.format()
    end
  })
