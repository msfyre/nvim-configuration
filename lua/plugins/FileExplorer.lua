return {
	{
		"stevearc/oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"icon",
					"size",
				},
				buf_options = {
					bufhidden = "hide",
				},
				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["<BS>"] = { "actions.parent", mode = "n" },
				},
			})
		end,
	},
}
