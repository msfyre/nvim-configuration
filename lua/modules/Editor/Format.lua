local module = {}

function module.Format(args)
	local conform_installed, conform = pcall(function()
		return require("conform")
	end)

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

return module
