local verifier = require("modules.verifier")

local terminal = {}

terminal.IsOpened = verifier.VerifyWindow(terminal.Window)

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
	if terminal.IsOpened == false then
		-- initiate window
		vim.cmd([[
			botright vnew
			vertical resize 50
		]])

		terminal.Window = vim.api.nvim_get_current_win()

		-- Open a new terminal window if no terminal buffer exists.
		-- Else, open that buffer instead.
		if terminal.Buffer == nil then
			OpenNew()
		else
			vim.cmd("buffer" .. terminal.Buffer)
		end
	end
end
function terminal.Close()
	if terminal.IsOpened == true then
		-- move to terminal window
		vim.api.nvim_set_current_win(terminal.Window)

		local mode = vim.api.nvim_get_mode().mode

		if string.lower(mode) == "v" or mode == "\22" then
			terminal.Escape()
		end

		vim.cmd("q")

		terminal.Window = nil
	end
end
function terminal.Toggle()
	terminal.IsOpened = verifier.VerifyWindow(terminal.Window)

	if terminal.IsOpened == false or not terminal.IsOpened then
		terminal.Open()
	else
		terminal.Close()
	end
end

return terminal
