-- Autocmds are automatically loaded on the VeryLazy event

-- Autosave when leaving a buffer or losing focus
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})
