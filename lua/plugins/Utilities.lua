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
}
