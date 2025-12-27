return {
	"rcarriga/nvim-notify",
	events = { "VimEnter" },
	config = function()
		local notify_macro = require("modules.plugin_macros.notify")

		notify_macro.setup({
			-- Configuration
			fps = 60,
			top_down = false,
			render = "simple",
			stages = "slide_out",
		})

		vim.notify = notify_macro.notify
	end,
}
