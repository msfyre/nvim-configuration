local notifyInstalled, notifyPlugin = pcall(function()
	return require("notify")
end)

local macro = {}

macro.Queue = {}

function macro.addToQueue(text, level, opts)
	local notifData = {
		text = text,
		level = level,
		opts = opts,
	}

	table.insert(macro.Queue, notifData)
end

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

	macro.addToQueue(text, level, opts)

	for i, notification in ipairs(macro.Queue) do
		coroutine.wrap(notifyPlugin.notify)(notification.text, notification.level, notification.opts)

		-- Eliminate it from the queue since it's no longer needed.
		macro.Queue[i] = nil
	end
end

return macro
