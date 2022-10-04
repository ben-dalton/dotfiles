local status, luasnip = pcall(require, "luasnip")
if (not status) then return end

require("luasnip.loaders.from_vscode").layz_load()
-- require('luasnip').filetype_extend("typescript", { "typescriptreact", "" })
-- require('luasnip').filetype_extend("javascript", { "javascriptreact" })
-- require('luasnip').filetype_extend("javascript", { "html" })
