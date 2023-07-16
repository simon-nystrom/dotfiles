require("lazy-setup")
require("options")
require("keybinds")
require("lsp.all")
require("lsp.null")
require("lsp.lua")
require("lsp.typescript")
require("lsp.python")
require("lsp.tailwind")
require("lsp.rust")
require("lsp.elixir")
require("nvim-tree-settings")
require("nvim-treesitter-settings")
require("nvim-cmp-settings")

require("gitsigns").setup({})
require("lualine").setup({})
require("mini.jump2d").setup()
require("mini.pairs").setup()
require("neotest").setup({ output = { open_on_run = false }, adapters = { require("neotest-elixir")({}) } })

require("repo_navigation")
require("project_nvim").setup({})

require("telescope").load_extension("projects")
