local module = {}

function module.WaitUntil(conditionfn, callbackfn, timeout, interval)
	interval = interval or 50
	local start_time = vim.loop.now()

	local timer = vim.loop.new_timer()
	timer:start(
		0,
		interval,
		vim.schedule_wrap(function()
			if conditionfn() then
				timer:stop()
				timer:close()

				if callbackfn then
					callbackfn()
				end
			elseif (vim.loop.now() - start_time) >= timeout then
				timer:stop()
				timer:close()

				vim.notify("Timeout waiting for condition", vim.log.levels.ERROR)
			end
		end)
	)
end

return module
