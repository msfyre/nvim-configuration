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
					local success, neotree_module = pcall(function()
						return require("lua.modules.neotree");
					end);
					
					if (success) then
						neotree_module.Toggle()
					else
						vim.notify("Not found!", "error", {
							title = "Neotree Module"
						})
					end
				end,
			},
			{
				hotkey = "<F11>",
				action = function ()
					if (vim.g.neovide) then
						local isFullscreen = vim.g.neovide_fullscreen
						
						vim.g.neovide_fullscreen = not isFullscreen
					end
				end
			}
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
				hotkey = "<C-[>",
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
