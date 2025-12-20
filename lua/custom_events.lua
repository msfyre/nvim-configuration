local events = {}

function events.OnInitDone()
	local initMod = require("lua.modules.init")

	initMod.applyConfigs()

	initMod.initDone = true
end

return events
