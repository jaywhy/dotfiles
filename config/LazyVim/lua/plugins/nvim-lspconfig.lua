-- Mason does not properly work with different version of Ruby.
-- It links to whatever version of Ruby you originally installed it with.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          enabled = true,
          cmd = { "/Users/jason/.asdf/shims/ruby-lsp" },
        },
      },
    },
  },
}
