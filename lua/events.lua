local events = {}

events.VimEnter = function()
	require("modules.Initialization.Overrides")
	require("modules.Initialization.UserCMDs")
	require("modules.Initialization.Hotkeys")

	require("modules.Initialization.LSPConfigs")

	require("config.Lazy")

	require("modules.Initialization.Theme")

	if vim.g.neovide then
		require("after.Neovide.Apply")
	end
end

events.BufWinEnter = function()
	vim.cmd("silent! loadview")
end
events.BufWinLeave = function()
	vim.cmd("silent! mkview")
end

events.BufWritePre = function(args)
	require("modules.Editor.Lint").Lint()
	require("modules.Editor.Format").Format(args)
end

events.BufWritePost = function(args)
	vim.notify("File: " .. args.file, "info", {
		title = "Saved!",
	})
end

return events
