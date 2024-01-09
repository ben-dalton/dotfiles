return {
	{
		"lalitmee/cobalt2.nvim",
		event = { "ColorSchemePre" }, -- if you want to lazy load
		dependencies = { "tjdevries/colorbuddy.nvim" },
		init = function()
			require("colorbuddy").colorscheme("cobalt2")

			-- show cursor line only in active window
			local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
			vim.api.nvim_create_autocmd(
				{ "InsertLeave", "WinEnter" },
				{ pattern = "*", command = "set cursorline", group = cursorGrp }
			)
			vim.api.nvim_create_autocmd(
				{ "InsertEnter", "WinLeave" },
				{ pattern = "*", command = "set nocursorline", group = cursorGrp }
			)
			vim.cmd.colorscheme("cobalt2")
		end,
	},
}
