local Vim = {}

function Vim.Run()
	print("Neovim is initializing...");

	neovide.Initialize();

	pluginsModule.Initialize();

	LSPModule.Initialize();

	neotreeModule.Init();

	events.Initialize();
	events.onVimRun();
end

return Vim