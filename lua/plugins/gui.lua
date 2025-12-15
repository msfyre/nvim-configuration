return {
	--#region Notifications
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")

			notify.setup({
				-- Configuration
				fps = 60,
				top_down = false,
			})

			vim.notify = notify.notify;
		end
	},
	--#endregion
	--#region Status Line
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require("lualine").setup({
				options = {
					theme = "iceberg_dark"
				}
			})
		end
	},
	--#endregion
}
