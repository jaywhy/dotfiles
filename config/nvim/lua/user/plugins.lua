local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Plugin manager
  use "nvim-lua/plenary.nvim" -- A set of lua functions used by other plugins
  use "windwp/nvim-autopairs" -- A super powerful autopair plugin for Neovim that supports multiple characters.
  use "tpope/vim-surround" -- Surrounds text with pairs of characters.
  use "tpope/vim-sensible" -- Sensible vim default configuration
  use "tpope/vim-fugitive" -- Git integration for vim
  use "akinsho/toggleterm.nvim" -- Toggle between terminal and vim
  use { "nvim-lualine/lualine.nvim", requires = { 'kyazdani42/nvim-web-devicons', opt = true } } -- Statusline

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- A vim plugin for exploring files and directories
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1 }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Themes
  use "navarasu/onedark.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"

  -- CMP plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "onsails/lspkind-nvim" -- adds vscode-like pictograms to neovim built-in lsp

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
