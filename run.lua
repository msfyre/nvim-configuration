local Vim = {}

function Vim.InitializeLayout()
	print("Setting layout...");

	vim.cmd("res 44.5")

    vim.opt.tabstop = 4;
	vim.opt.shiftwidth = 4;
	vim.opt.expandtab = true;

	neovide.Initialize();
end

function Vim.InitializeCommands()
	print("Initializing custom commands...");

	for i, command in pairs(commands) do
		vim.api.nvim_create_user_command(
			command.commandName,
			command.callback,
			{
				desc = command.commandDescription
			}
		)
	end
end

function Vim.Run()
	print("Neovim is initializing...");

	Vim.InitializeCommands();
	Vim.InitializeLayout();

	pluginsModule.Initialize();

	LSPModule.Initialize();

	neotreeModule.Init();

	events.Initialize();
	events.onVimRun();
end

return Vim
