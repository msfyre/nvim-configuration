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
						oil.toggle_float()
					else
						vim.notify("The plugin is not installed!", "error", {
							title = "oil.nvim",
						})
					end
				end,
			},
			{
				hotkey = "<leader>t",
				action = function()
					local current = vim.fn.getcwd()
					-- initiate window
					vim.cmd([[
						botright vnew
						vertical resize 50
					]])

					-- run powershell
					vim.cmd('terminal powershell -NoExit -Command Set-Location "' .. current .. '"')
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
				hotkey = "<M-c>",
				action = function()
					vim.cmd('"+y')
				end,
				{
					desc = "Copy selected text.",
				},
			},
		},
		insert = {
			{
				hotkey = "<C-S>",
				action = function()
					vim.cmd("w!")
				end,
				{
					desc = "Save your progress",
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
