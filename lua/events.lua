local events = {}

events.VimEnter = function()
	require("modules.Initialization.Overrides")

	require("config.Lazy")

	require("modules.Initialization.Theme")
	require("modules.Initialization.Hotkeys")

	if vim.g.neovide then
		require("after.Neovide.Apply")
	end
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
		vim.schedule(function()
			local ok, err = pcall(lint.try_lint)

			if not ok then
				vim.notify(err, "error", {
					title = "Lint error!",
				})
			end
		end)
	end
	if conform_installed then
		vim.schedule(function()
			local ok, err = pcall(conform.format, {
				bufnr = args.buf,
			})

			if not ok then
				vim.notify(err, "error", {
					title = "Formatting error!",
				})
			end
		end)
	end
end
events.BufWritePost = function(args)
	vim.notify("File: " .. args.file, "info", {
		title = "Saved!",
	})
end

return events
