-- TODO: Reformat all of this bullshit
-- (@msfyre, 12/14/2025)
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
				hotkey = "<leader><C-S>",
				action = function()
					vim.cmd("wa!")
				end,
				{
					desc = "Save all",
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
					local terminal_module = require("modules.terminal")

					terminal_module.Toggle()
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
			{
				hotkey = "<Tab>",
				action = function()
					-- get all selected text
					local selection_module = require("lua.modules.selection")
					local selection = selection_module:Get()

					local replaced = {}

					if selection ~= nil then
						for i, line in ipairs(selection.lines) do
							replaced[i] = "\t" .. line
						end

						local buffer = vim.api.nvim_get_current_buf()

						vim.api.nvim_buf_set_lines(buffer, selection.start_row - 1, selection.end_row, false, replaced)
					end
				end,
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
			{
				hotkey = "<leader><C-S>",
				action = function()
					vim.cmd("wa!")
				end,
				{
					desc = "Save all",
				},
			},
		},
		terminal = {
			{
				hotkey = "<Esc>",
				action = function()
					local terminal_module = require("modules.terminal")

					terminal_module.Escape()
				end,
				{
					desc = "Easily free yourself from a terminal window.",
				},
			},
		},
	},
}

return hotkeys
