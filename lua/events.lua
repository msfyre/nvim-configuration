local initMod = require("lua.modules.init")

local custom_events = require("custom_events")

local events = {}

events.VimEnter = function()
	initMod.applyOverrides()

	require("config.lazy")

	initMod.applyTheme()

	initMod.appluUserCMDs()
	initMod.applyHotkeys()

	custom_events.OnInitDone()
end

events.BufWinEnter = function()
	vim.cmd("silent! loadview")
end

events.BufWinLeave = function()
	vim.cmd("silent! mkview")
end

return events
