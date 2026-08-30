-- Keymaps are automatically loaded on the VeryLazy event
-- macOS-only: Cmd-S to save (mirrors the muscle memory from GUI editors)
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<esc><cmd>w<cr><esc>", { desc = "Save file" })
