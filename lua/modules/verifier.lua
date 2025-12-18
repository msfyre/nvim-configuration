local module = {}

function module.VerifyWindow(windowID)
	local success, valid = pcall(function()
		return vim.api.nvim_win_is_valid(windowID)
	end)

	if success then
		return valid
	else
		return false
	end
end

function module.VerifyBuffer(bufferID)
	local success, buffer = pcall(function()
		return vim.api.nvim_buf_is_loaded(bufferID)
	end)

	if success then
		return buffer
	else
		return false
	end
end

return module
