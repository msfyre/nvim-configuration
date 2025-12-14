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
	--#region File Explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
		lazy = false
	}
	--#endregion
}