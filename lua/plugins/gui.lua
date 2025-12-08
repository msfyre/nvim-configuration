return {
	-- Dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			-- determine config file and directory safely
			local config_file = vim.env.MYVIMRC or (vim.fn.stdpath("config") .. "/init.lua")
			local config_dir = vim.fn.fnamemodify(config_file, ":h")

			require("dashboard").setup({
				theme = "hyper",
				disable_move = true,
				config = {
					header = {
						"NEOVIM (c) 2015-2025",
					},
					packages = { enable = true },
					footer = {
						"This setup is made by Moonstone Fyre (github.com/msfyre)",
					},
				},
			})
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	-- CMD Line
	{
		"folke/noice.nvim",
		dependencies = {
			"nui.nvim",
			"nvim-notify",
			"nvim-treesitter",
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				cmdline = {
					view = "cmdline_popup",
					format = {
						cmdline = { title = "Command Prompt" },
					},
				},
			})
		end,
	},
	-- Indent guides
	{
		"preservim/vim-indent-guides",
		config = function()
			local indentTheme = require("themes.indents")

			local oddConfigCMD = string.format("hi IndentGuidesOdd guibg=%s", indentTheme.odd.background)
			local evenConfigCMD = string.format("hi IndentGuidesEven guibg=%s", indentTheme.even.background)

			vim.cmd(oddConfigCMD)
			vim.cmd(evenConfigCMD)
		end,
	},
}
