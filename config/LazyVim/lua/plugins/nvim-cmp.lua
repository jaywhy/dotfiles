-- By default hitting enter will select the completion item.
-- This breaks endwise, besides I prefer hitting tab.
--   {
-- return {
--     -- Disable default Tab Key mappings in LuaSnip
--     "L3MON4D3/LuaSnip",
--     keys = function()
--       return {}
--     end,
--   },
--   {
--     "hrsh7th/nvim-cmp",
--     ---@param opts cmp.ConfigSchema
--     opts = function(_, opts)
--       local cmp = require("cmp")
--       opts.mapping = cmp.mapping.preset.insert({
--         -- Press Tab to autocomplete
--         ["<Tab>"] = cmp.mapping.confirm({ select = true }),
--       })
--     end,
--   },
-- }
--
--
local cmp = require("cmp")
return {
  "hrsh7th/nvim-cmp",
  opts = {
    mapping = {
      ["<CR>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),
    },
  },
}
