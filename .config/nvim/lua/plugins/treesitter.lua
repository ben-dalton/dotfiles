return {
	{ "windwp/nvim-ts-autotag" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({
				hook = function()
					require("ts_context_commentstring").update_commentstring()
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"css",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"tsx",
					"typescript",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = {
					enable = true,
				},
			})
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
