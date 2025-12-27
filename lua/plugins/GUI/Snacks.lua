return {
	"folke/snacks.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope.nvim",
	},
	lazy = false,
	priority = 1000,
	opts = {
		-- GUI
		explorer = { enabled = true, cwd = true },
		dashboard = { enabled = true },

		-- Editor
		indent = { enabled = true },
	},
	keys = {
		-- File Explorer
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		-- Search
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					hidden = true,
					no_ignore = false,
				})
			end,
			desc = "Find Files",
		},
		{
			"<leader>f/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
	},
}
