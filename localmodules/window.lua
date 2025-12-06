local WelcomeMessage = {
	"Neovim ran successfully!",
	"Have a nice day!",
	"\n",
	"This neovim setup is purely written by Moonstone Fyre.",
	"(@msfyre --- 2025)"
}


local WindowModule = {}

WindowModule.isSidebarOpen = false;

function WindowModule.ToggleSidebar()
	local newState = not WindowModule.isSidebarOpen;

	if (not WindowModule.isSidebarOpen) then
		-- initialize terminal
		vim.cmd [[
			botright vnew
			terminal powershell
		]];

		-- initialize cava
		vim.cmd("belowright new");
		vim.cmd("RunCava");
	else

	end

	WindowModule.isSidebarOpen = newState;
end

function WindowModule.ShowFileTree()
	neotreeModule.Show();
end

function WindowModule.ShowWelcome()
	for i, messageString in ipairs(WelcomeMessage) do
		print(messageString .. "\n");
	end
end

return WindowModule