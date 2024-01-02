return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	autotag = {
		enable = true,
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "lua", "javascript", "html", "css", "typescript" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
