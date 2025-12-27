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
				local terminal_module = require("modules.GUI.Terminal")

				terminal_module.Escape()
			end,
			info = {
				desc = "Escape the terminal",
			},
		},
		{
			modes = { "n", "v" },
			hotkey = "<leader>t",
			action = function()
				local terminal_module = require("modules.GUI.Terminal")

				terminal_module.Toggle()
			end,
		},
	},
}

return hotkeys
