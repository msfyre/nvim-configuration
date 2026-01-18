local module = {}

function module.Lint()
	local lint_installed, lint = pcall(function()
		return require("lint")
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
end

return module
