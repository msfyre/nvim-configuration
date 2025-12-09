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
			local cavaConfig = config_path .. "/lua/config/cava_config.txt"

			vim.cmd("terminal powershell cava -p " .. cavaConfig)
			vim.cmd("IndentGuidesDisable")
		end,
	},
}

return commands
