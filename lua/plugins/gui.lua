return {
	--#region Notifications
	{
		"rcarriga/nvim-notify",
		events = { "VimEnter" },
		config = function()
			local notify_macro = require("modules.plugin_macros.notify")

			notify_macro.setup({
				-- Configuration
				fps = 60,
				top_down = false,
				render = "simple",
				stages = "slide_out",
			})

			vim.notify = notify_macro.notify
		end,
	},
	--#endregion
	--#region Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "iceberg_dark",
				},
			})
		end,
	},
	--#endregion
	--#region Tabs
	{
		"nanozuki/tabby.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("tabby").setup()
		end,
	},
	--#endregion
}
