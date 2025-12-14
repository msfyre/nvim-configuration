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
					["<CR>"] = {
						function()
							local current = require("oil").get_current_dir()
							local actions = require("oil.actions")

							vim.cmd("cd " .. current)
							actions.select.callback()
						end,
					},
				},
			})
		end,
	},
}
