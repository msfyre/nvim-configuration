local module = {}

function module:Get()
	local mode = vim.api.nvim_get_mode().mode
	local opts = {}

	if string.lower(mode) == "v" or mode == "\22" then
		opts.type = mode
	else
		return {}
	end

	local start_pos = vim.fn.getpos("v")
	local end_pos = vim.fn.getpos(".")

	local selection = vim.fn.getregion(start_pos, end_pos, opts)

	return {
		lines = selection,
		start_row = start_pos[2],
		end_row = end_pos[2],
		start_col = start_pos[3],
		end_col = end_pos[3],
		mode = opts.type,
	}
end

return module
