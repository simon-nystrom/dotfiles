vim.g.mapleader = " "

local km = vim.keymap.set

km("n", "<C-h>", "<C-w>h", { desc = "Window Focus Left" })
km("n", "<C-j>", "<C-w>j", { desc = "Window Focus Down" })
km("n", "<C-l>", "<C-w>l", { desc = "Window Focus Right" })

km("n", "<C-k>", "<C-w>k", { desc = "Window Focus Up" })
km("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

km("v", "<leader>rr", ":s//g<Left><Left>", { silent = false })
km("n", "<leader>rw", 'viwy:%s/<C-r>"//g<Left><Left>', { silent = false, desc = "Replace Word in File" })

local builtin = require("telescope.builtin")
km("n", "<leader>ff", builtin.find_files)
km("n", "<leader>fg", builtin.live_grep)
km("n", "<leader>fb", builtin.buffers)
km("n", "<leader>ft", builtin.help_tags)
km("n", "<leader>fs", builtin.spell_suggest)
km("n", "<leader>fr", builtin.registers)
km("n", "<leader>fc", builtin.commands)
km("n", "<leader>fh", builtin.command_history)
km("n", "<leader>fd", builtin.diagnostics)

km("n", "<leader>tr", function()
  require("neotest").run.run()
end)

km("n", "<leader>s", ":w<CR>", { silent = false })
km("n", "<leader>q", ":q<CR>")

km("n", "<C-d>", "<C-d>zz")
km("n", "<C-u>", "<C-u>zz")
km("n", "n", "nzz")
km("n", "N", "Nzz")

km("n", "∆", ":m+1<CR>", { silent = true })
km("n", "√", ":m+1<CR>", { silent = true })
km("n", "˚", ":m-2<CR>", { silent = true })
km("n", "ª", ":m-2<CR>", { silent = true })

km("n", "<leader>log", function()
  local buf = vim.api.nvim_get_current_buf()                                                                -- Get the current buffer
  local row = unpack(vim.api.nvim_win_get_cursor(0))                                                        -- Get cursor position

  vim.api.nvim_buf_set_lines(buf, row, row, false, { "console.log({" .. vim.fn.expand("<cword>") .. "})" }) -- Replace the line with the new line
end)
