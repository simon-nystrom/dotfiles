vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1

require("nvim-tree").setup({ remove_keymaps = { "<C-e>" } })

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeFindFileToggle<CR>', opts)
