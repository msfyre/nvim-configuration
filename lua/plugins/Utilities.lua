return {
	--#region Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		opts = {
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
		},
	},
	--#endregion
	--#region Auto-Focus
	{
		"nvim-focus/focus.nvim",
		opts = {
			enable = true,
			autoresize = {
				minwidth = 10,
				minheight = 5,
			},
		},
	},
	--#endregion
}
