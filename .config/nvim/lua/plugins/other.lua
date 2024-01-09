return {
	{ "wesQ3/vim-windowswap" },
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
	{
		"johmsalas/text-case.nvim",
		config = function()
			require("textcase").setup()
		end,
	},
}
