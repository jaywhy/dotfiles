-- Options are automatically loaded before lazy.nvim startup.
-- remote_clipboard is provided by omarchy-nvim on Linux; absent on macOS.
local ok, remote_clipboard = pcall(require, "config.remote_clipboard")
if ok then
  remote_clipboard.setup()
end

vim.opt.relativenumber = false
vim.g.autoformat = false

if vim.g.vscode then
  -- undo/redo via vscode
  vim.keymap.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
  vim.keymap.set("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")
end
