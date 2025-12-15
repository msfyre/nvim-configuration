local Events = {}

Events.VimEnter = function()
	local initMod = require("lua.modules.init")

	initMod.applyOverrides()

	-- Boot lazy
	require("config.lazy")

	initMod.applyHotkeys()
	initMod.applyConfigs()
	initMod.applyTheme()
end

Events.BufWinEnter = function()
	vim.cmd("silent! loadview")
end

Events.BufWinLeave = function()
	vim.cmd("silent! mkview")
end

return Events
