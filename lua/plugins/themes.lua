return {
	{
		"catppuccin/nvim",
		lazy = true,
		config = function ()
			vim.cmd([[colorscheme catppuccin]])
		end
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function ()
			vim.cmd([[colorscheme tokyonight]])
		end
	}
}
