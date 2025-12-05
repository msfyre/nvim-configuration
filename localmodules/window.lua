local WelcomeMessage = {
	"Neovim ran successfully!",
	"Have a nice day!",
	"\n",
	"This neovim setup is purely written by Moonstone Fyre.",
	"(@msfyre --- 2025)"
}


local WindowModule = {}

function WindowModule.ShowFileTree()
	neotreeModule.Show();
end

function WindowModule.ShowWelcome()
	for i, messageString in ipairs(WelcomeMessage) do
		print(messageString .. "\n");
	end
end

return WindowModule