local hotkeys = {
	leader = " ",
	mappings = {
		normal = {
			{
				hotkey = "<C-S>",
				action = function()
					vim.cmd("w")
					vim.notify("File saved!.", vim.log.levels.INFO, { title = "Saved!" })
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
					require("lua.modules.neotree").Toggle()
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
				end,
				{
					desc = "Easily free yourself from a terminal window."
				}
			},
		},
	},
}

return hotkeys
