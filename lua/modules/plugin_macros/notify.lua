local notifyInstalled, notifyPlugin = pcall(function()
	return require("notify")
end)

local macro = {}

function macro.setup(opts)
	if not notifyInstalled then
		return
	end

	notifyPlugin.setup(opts)
end

function macro.notify(text, level, opts)
	if not notifyInstalled then
		return
	end

	local on_open = function()
		-- Play SFX here
	end

	opts["on_open"] = on_open

	notifyPlugin.notify(text, level, opts)
end

return macro
