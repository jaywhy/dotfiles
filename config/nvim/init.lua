require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.bufferline"
require "user.telescope"
require "user.treesitter"
require "user.cmp"
require "user.lsp"

-- Theme
require('onedark').setup {
  style = 'warm'
}
require('onedark').load()

-- Lualine
require('lualine').setup()

vim.g.tmux_navigator_save_on_switch = 1
vim.g.copilot_assume_mapped = true
vim.g["test#strategy"] = "vimux"

