local hotkeys = {
	leader = " ",
	mappings = {
		normal = {
			{
				hotkey = "<C-S>",
				action = function()
					vim.cmd("w!")
				end,
				{
					desc = "Save your progress",
				},
			},
			{
				hotkey = "<C-V>",
				action = function()
					vim.cmd('"+P')
				end,
				{
					desc = "Paste from the clipboard",
				},
			},
			{
				hotkey = "<leader>e",
				action = function()
					local success, oil = pcall(function()
						return require("oil")
					end)

					if success then
						vim.cmd("Oil");
					else
						vim.notify("The plugin is not installed!", "error", {
							title = "oil.nvim",
						})
					end
				end,
			},
			{
				hotkey = "<F11>",
				action = function()
					if vim.g.neovide then
						local isFullscreen = vim.g.neovide_fullscreen

						vim.g.neovide_fullscreen = not isFullscreen
					end
				end,
			},
		},
		visual = {
			{
				hotkey = "<C-c>",
				action = function()
					vim.cmd('"+y')
				end,
				{
					desc = "Copy selected text.",
				},
			},
		},
		terminal = {
			{
				hotkey = "<Esc>",
				action = function()
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "t", false)

					vim.notify("Escaped the terminal.", "info", {
						title = "Terminal",
					})
				end,
				{
					desc = "Easily free yourself from a terminal window.",
				},
			},
		},
	},
}

return hotkeys
