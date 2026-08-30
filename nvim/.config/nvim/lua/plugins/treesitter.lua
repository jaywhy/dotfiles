return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    opts = {
      endwise = { enable = true },
      ensure_installed = {
        "css",
        "eex",
        "elixir",
        "ruby",
        "rust",
      },
    },
  },
}
