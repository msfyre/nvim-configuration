local module = {}

function module.VerifyWindow(windowID)
	local success, valid = pcall(function() 
		return vim.api.nvim_win_is_valid(windowID)
	end)

	if (success) then
		return valid
	else
		return false
	end
end

return module
