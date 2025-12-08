local commands = {
	{
		command = "Save",
		callback = function()
			vim.cmd("w")
		end,
		config = {
			description = "Save your progress.",
		},
	},
	{
		command = "Save All",
		callback = function()
			vim.cmd("wa")
		end,
		config = {
			description = "Save your progress in all buffers.",
		},
	},
}

return commands
