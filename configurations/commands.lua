local commands = {
	Cava = {
		commandName = "RunCava",
		commandDescription = "Runs the CAVA visualizer",
		callback = function ()
			vim.cmd("terminal powershell cava -p " .. cava_config)
		end
	},
    Sidebar = {
        commandName = "ToggleSidebar",
        commandDescription = "Opens the sidebar of the client.",
        callback = function ()
            windowModule.ToggleSidebar();
        end
    }
}

return commands
