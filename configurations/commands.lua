local commands = {
	Cava = {
		commandName = "RunCava",
		commandDescription = "Runs the CAVA visualizer",
		callback = function ()
			vim.cmd("botright vnew");
			vim.cmd("terminal powershell cava -p " .. cava_config)
		end
	}
}

return commands