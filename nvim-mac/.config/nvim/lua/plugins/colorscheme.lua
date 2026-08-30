-- macOS colorscheme. On Omarchy the theme is set by omarchy-nvim's theme.lua;
-- here we pick it ourselves (was plugins/core.lua before the rebase in ce8ae74).
return {
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },
}
