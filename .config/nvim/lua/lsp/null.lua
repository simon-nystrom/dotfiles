local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(c)
              return c.name ~= "tsserver"
            end,
          })
        end,
      })
    end
  end,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.mix,

    null_ls.builtins.code_actions.eslint_d,

    null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.diagnostics.credo,
    null_ls.builtins.formatting.autopep8,
  },
})
