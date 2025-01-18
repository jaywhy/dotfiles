vim.g.mapleader = ' '
vim.opt.mouse = 'a' 
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

require("config.lazy")

vim.cmd.colorscheme "catppuccin"
