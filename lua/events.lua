local Events = {}

Events.VimEnter = function ()
	local initMod = require("lua.modules.init");

	initMod.applyOverrides();

	-- Boot lazy
	require("config.lazy")

	initMod.applyHotkeys();
	initMod.applyConfigs();
	initMod.applyTheme();
end

return Events
