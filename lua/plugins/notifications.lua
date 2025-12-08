return {
	"rcarriga/nvim-notify",
	config = function()
		local notifyPlugin = require("notify")

		notifyPlugin.setup({
			render = "default",
			stages = "slide",
			top_down = false,
		})

		vim.notify = notifyPlugin.notify
	end,
}
