local events = require("lua.events")

for event, callbackfn in pairs(events) do
	vim.api.nvim_create_autocmd(event, {
		callback = callbackfn,
	})
end
