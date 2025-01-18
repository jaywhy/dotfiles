-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.vscode then
    -- undo/REDO via vscode
    vim.keymap.set("n","u","<Cmd>call VSCodeNotify('undo')<CR>")
    vim.keymap.set("n","<C-r>","<Cmd>call VSCodeNotify('redo')<CR>")
end
