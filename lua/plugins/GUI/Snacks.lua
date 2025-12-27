return {
	"folke/snacks.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	priority = 1000,
	--- @type snacks.Config
	opts = {
		-- Files
		bigfile = { enabled = true },

		-- Editor
		indent = { enabled = true },

		-- File Explorer
		explorer = { enabled = true },
		statuscolumn = { enabled = true },

		-- GUI
		dashboard = { enabled = true },
	},
	keys = {
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File explorer.",
		},
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
		},
	},
}
