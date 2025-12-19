return {
	{
		name = "InitRobloxTS",
		desc = "Initialize a tab to run the compiler and Rojo in the background",
		action = function()
			local rblxts_tab_mod = require("modules.tabs.rblxts")

			rblxts_tab_mod.Init()
		end,
	},
}
