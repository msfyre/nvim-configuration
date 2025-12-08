local Events = {}

-- call initMod at event time to avoid circular requires / early execution
Events.VimEnter = function()
	local initMod = require("lua.modules.initMod")

	initMod.applyConfigs()
	initMod.applyTheme()

	initMod.applyHotkeys()

	vim.notify("Neovim is now running!", "info", {
		title = "Welcome!",
	})
end

Events.WinEnter = function()
	vim.cmd("setlocal cursorline")
end

Events.BufReadPost = function()
	local filepath = vim.fn.expand("%:p:h")

	vim.cmd("IndentGuidesEnable")

	vim.notify("File: " .. filepath, "info", {
		title = "Opened!",
	})

	vim.cmd("cd " .. filepath)

	neotree.Open()
	neotree.Refresh()
end

Events.BufWritePost = function()
	local filepath = vim.fn.expand("%:p:h")

	vim.notify("[File]: " .. filepath, "info", {
		title = "Saved!",
	})
end

return Events
