local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap('n', '<C-a>', 'gg<S-v>G', opts) -- Select all

-- Telescope
keymap('n', '<C-p>', ':Telescope git_files<CR>', opts)
keymap('n', '<leader>p', ':Telescope find_files<CR>', opts)
keymap('n', '<C-S-p>', ':Telescope commands<CR>', opts)
keymap('n', '<C-f>', ':Telescope live_grep<CR>', opts)

keymap('n', '<leader>frg', 'viwy:%s/<C-r>"//g<Left><Left>', { noremap = true, silent = false })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)



vim.keymap.set('n', '<leader>rt', function() require('neotest').run.run() end,
  { noremap = true, silent = true })
