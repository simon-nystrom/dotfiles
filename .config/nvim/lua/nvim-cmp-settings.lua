local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  completion = { completeopt = 'menu,menone,noinsert' },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>']   = cmp.mapping.select_prev_item(),
    ['<C-n>']   = cmp.mapping.select_next_item(),
    ['<CR>']    = cmp.mapping.confirm({ select = true }),
    ['<C-b>']   = cmp.mapping.complete(),
    ['<Tab>']   = cmp.mapping(function(fallback)
      if (cmp.visible()) then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if (cmp.visible()) then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', auto_select = true },
    { name = 'vsnip',    auto_select = true },
  }, {
    { name = "buffer" },
  })
})
