local terminal = {}

terminal.IsOpened = false

terminal.Window = nil
terminal.Buffer = nil

local function OpenNew()
	local current = vim.fn.getcwd()

	vim.cmd('terminal powershell -NoExit -Command Set-Location "' .. current .. '"')

	terminal.Buffer = vim.api.nvim_get_current_buf()
end

function terminal.Escape()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "t", false)

	vim.notify("Escaped the terminal.", "info", {
		title = "Terminal",
	})
end

function terminal.Open()
	if terminal.IsOpened == false and (terminal.Window == nil) then
		-- initiate window
		vim.cmd([[
			botright vnew
			vertical resize 50
		]])

		terminal.Window = vim.api.nvim_get_current_win()

		if terminal.Buffer == nil then
			OpenNew()
		else
			-- Open the existing buffer
			vim.cmd("buffer" .. terminal.Buffer)
		end

		terminal.IsOpened = true
	end
end
function terminal.Close()
	if terminal.IsOpened == true and (terminal.Window ~= nil) then
		-- move to terminal window
		vim.api.nvim_set_current_win(terminal.Window)

		local mode = vim.api.nvim_get_mode().mode

		if string.lower(mode) == "v" or mode == "\22" then
			terminal.Escape()
		end

		vim.cmd("q")

		terminal.Window = nil
		terminal.IsOpened = false
	end
end
function terminal.Toggle()
	if terminal.IsOpened == false or terminal.Window == nil then
		terminal.Open()
	else
		terminal.Close()
	end
end

return terminal
