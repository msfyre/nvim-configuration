return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "[/]",
					package_pending = "[...]",
					package_uninstalled = "[X]",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = {
				exclude = {
					"luau_lsp",
				},
			},
			ensure_installed = {
				"lua_ls",
				"vimls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
	},
}
