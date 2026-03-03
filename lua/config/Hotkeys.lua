local hotkeys = {
	leader = " ",
	mappings = {
		-- Lint
		{
			modes = { "n", "v" },
			hotkey = "<leader>l",
			action = function()
				local lint_module = require("modules.Editor.Lint")

				lint_module.Lint()
			end,
		},
		-- Save
		{
			modes = { "n", "i" },
			hotkey = "<C-S>",
			action = function()
				vim.cmd("wa!")
			end,
			info = {
				desc = "Save your progress!",
			},
		},
		-- Terminal window
		{
			modes = { "n", "v" },
			hotkey = "<leader>t",
			action = function()
				local terminal_module = require("modules.GUI.Terminal")

				terminal_module.Toggle()
			end,
		},
		{ -- Fullscreen Toggle
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
	},
}

return hotkeys
