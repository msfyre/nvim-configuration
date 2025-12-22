local initMod = require("lua.modules.init")
local custom_events = require("custom_events")

local events = {}

events.VimEnter = function()
	initMod.applyOverrides()

	require("config.lazy")

	initMod.applyTheme()

	initMod.applyHotkeys()

	custom_events.OnInitDone()
end

events.BufWinEnter = function()
	vim.cmd("silent! loadview")
end
events.BufWinLeave = function()
	vim.cmd("silent! mkview")
end

events.BufWritePre = function(args)
	local lint_installed, lint = pcall(function()
		return require("lint")
	end)

	local conform_installed, conform = pcall(function()
		return require("conform")
	end)

	if lint_installed then
		local lint_success, result = pcall(function()
			return lint.try_lint()
		end)

		if lint_success then
			vim.notify("Success!", "info", {
				title = "Lint Status",
			})
		else
			vim.notify(result, "error", {
				title = "Lint Error!",
			})
		end
	end

	if conform_installed then
		local format_success, result = pcall(function()
			return conform.format({ bufnr = args.buf })
		end)

		if format_success then
			vim.notify("Success!", "info", {
				title = "Format Status",
			})
		else
			vim.notify(result, "error", {
				title = "Format Error!",
			})
		end
	end
end
events.BufWritePost = function(args)
	vim.notify("File: " .. args.file, "info", {
		title = "Saved!",
	})
end

return events
