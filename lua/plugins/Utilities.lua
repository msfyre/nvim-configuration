return {
	{ -- Autofocus
		"nvim-focus/focus.nvim",
		opts = {
			autoresize = {
				enable = true,
			},
			ui = {
				winhighlight = true,
				minwidth = 5,
			},
		},
	},
	{ -- Telescope
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
