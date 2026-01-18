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
function module.VerifyTab(tabID)
	local success, result = pcall(function()
		return vim.api.nvim_set_current_tabpage(tabID)
	end)

	return success
end
function module.VerifyFont(fontface)
	if fontface ~= nil then
		vim.notify("No Font Face passed!", "warn")
		return false
	end

	local success, result = pcall(function()
		vim.o.guifont = fontface .. ":h10"
	end)

	print(success)
end

return module
