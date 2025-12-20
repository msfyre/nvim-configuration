return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "ToggleMDPrev" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
