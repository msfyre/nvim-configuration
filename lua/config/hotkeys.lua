local hotkeys = {
	leader = " ",
	mappings = {
		-- Save
		{
			modes = { "n", "i" },
			hotkey = "<C-S>",
			action = function()
				vim.cmd("w!")
			end,
			info = {
				desc = "Save your progress!",
			},
		},
		-- Fullscreen Toggle
		{
			modes = { "n" },
			hotkey = "<F11>",
			action = function()
				if vim.g.neovide then
					local isFullscreen = vim.g.neovide_fullscreen

					vim.g.neovide_fullscreen = not isFullscreen
				end
			end,
			info = {
				desc = "Toggle fullscreen",
			},
		},
		-- Escape the terminal
		{
			modes = { "t" },
			hotkey = "<Esc>",
			action = function()
				local terminal_module = require("modules.terminal")

				terminal_module.Escape()
			end,
			info = {
				desc = "Escape the terminal",
			},
		},
		{
			modes = { "n" },
			hotkey = "<leader>t",
			action = function()
				local terminal_module = require("modules.terminal")

				terminal_module.Toggle()
			end,
		},
		-- File Explorer
		{
			modes = { "n" },
			hotkey = "<leader>e",
			action = function()
				local oil_installed, oil = pcall(function()
					return require("oil")
				end)

				local tree_installed, nvim_tree = pcall(function()
					return require("nvim-tree.api")
				end)

				if oil_installed then
					oil.toggle_float()
				end

				if tree_installed then
					nvim_tree.tree.toggle()
				end
			end,
		},
	},
}

return hotkeys
