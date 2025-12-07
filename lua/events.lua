local Events = {}

-- call initMod at event time to avoid circular requires / early execution
Events.VimEnter = function()
	require("lua.modules.initMod").applyConfigs();
	require("lua.modules.initMod").applyTheme();

	vim.cmd("let g:indent_guides_enable_on_vim_startup = 1");

	vim.notify("Neovim is now running!", "info", { title = "Welcome!" });
end

Events.WinEnter = function()
	vim.cmd("setlocal cursorline");
end

Events.BufReadPost = function()
	local filepath = vim.fn.expand("%:p:h");
	
	vim.notify(
		"File: " .. filepath,
		"info",
		{
			title = "Opened!"
		}
	);

	vim.cmd("cd " .. filepath);

	neotree.Open();
end

Events.BufWritePost = function()
	local filepath = vim.fn.expand("%:p:h")

	vim.notify(
		"[File]: " .. filepath,
		"info",
		{
			title = "Saved!"
		}
	);
end

return Events
