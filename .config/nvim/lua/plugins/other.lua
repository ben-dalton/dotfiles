return {
	{
		"filipdutescu/renamer.nvim",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("renamer").setup()
			vim.api.nvim_set_keymap(
				"i",
				"<F2>",
				'<cmd>lua require("renamer").rename()<cr>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>rn",
				'<cmd>lua require("renamer").rename()<cr>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<leader>rn",
				'<cmd>lua require("renamer").rename()<cr>',
				{ noremap = true, silent = true }
			)
		end,
	},
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
