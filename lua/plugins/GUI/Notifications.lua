return {
	"rcarriga/nvim-notify",
	events = { "VimEnter" },
	config = function()
		local notify = require("notify")

		notify.setup({
			-- Configuration
			fps = 60,
			top_down = false,
			render = "simple",
			stages = "slide_out",
		})

		vim.notify = notify.notify
	end,
}
