return {
	--#region Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					find_command = {
						"fd",
						"--type",
						"f",
						"--type",
						"d",
						"--hidden",
						"--follow",
					},
				},
			})
		end,
	},
	--#endregion
	--#region Auto-Focus
	{
		"nvim-focus/focus.nvim",
		version = "*",
		config = function()
			require("focus").setup({
				enable = true,
				autoresize = {
					minwidth = 10,
					minheight = 5,
				},
			})
		end,
	},
	--#endregion
}
