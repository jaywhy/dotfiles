return {
  "nvim-neotest/neotest",
  dependencies = {
    "olimorris/neotest-rspec",
    "zidhuss/neotest-minitest",
    "jfpedroza/neotest-elixir",
  },
  opts = {
    adapters = {
      ["neotest-rspec"] = {
        -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
        rspec_cmd = function()
          return {
            "bundle",
            "exec",
            "rspec",
          }
        end,
      },
      ["neotest-minitest"] = {},
      ["neotest-elixir"] = {},
    },
  },
}
