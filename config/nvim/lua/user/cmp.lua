local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local tabnine_status_ok, _ = pcall(require, "user.tabnine")
if not tabnine_status_ok then
  return
end

local compare = require "cmp.config.compare"

require("luasnip/loaders/from_vscode").lazy_load()
