return {
	{ -- File Explorer
		"stevearc/oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		events = "VimEnter",
		config = function()
			local oil = require("oil")

			oil.setup({
				default_file_explorer = true,
				view_options = {
					show_hidden = true,
				},
				columns = {
					"icon",
					"size",
				},
				keymaps = {
					["<BS>"] = { "actions.parent", mode = "n" },
					["<CR>"] = { "actions.select", mode = "n" },

					["x"] = { "actions.open_external", mode = "n" },
				},
				float = {
					padding = 2,
					max_width = 0.55,
					max_height = 0.45,
				},
			})
		end,
	},
	{ -- Notifications
		"rcarriga/nvim-notify",
		events = "VimEnter",
		config = function()
			local notify = require("notify")

			notify.setup({
				-- Configuration
				fps = 60,
				top_down = false,
				render = "simple",
				stages = "slide_out",
			})

			vim.notify = notify.notify
		end,
	},
	{ -- Status Line
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		events = "VimEnter",
		opts = {
			options = {
				theme = "iceberg_dark",
			},
		},
	},
	{ -- Themes
		{ "scottmckendry/cyberdream.nvim" },
		{ "catppuccin/nvim" },
	},
}
