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
		command = "SaveAll",
		callback = function()
			vim.cmd("wa")
		end,
		config = {
			description = "Save your progress in all buffers.",
		},
	},
	{
		command = "RunCava",
		callback = function()
			vim.cmd("terminal powershell cava")
		end,
	},
}

return commands
