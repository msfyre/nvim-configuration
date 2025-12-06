local Vim = {}

function Vim.InitializeLayout()
	print("Setting layout...");

    vim.opt.tabstop = neovimConfig.editor.tabSize;
	vim.opt.shiftwidth = neovimConfig.editor.tabSize;
	vim.opt.expandtab = neovimConfig.editor.useSpaces;

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

	discordModule.DisplayRichPresence();

	events.Initialize();
	events.onVimRun();
end

return Vim
