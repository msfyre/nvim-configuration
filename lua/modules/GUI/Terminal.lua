local verifier = require("modules.Utilities.Verifier")

local terminal = {}

terminal.IsWindowOpen = verifier.VerifyWindow(terminal.Window)
terminal.IsBufferOpen = verifier.VerifyBuffer(terminal.Buffer)

terminal.Window = nil
terminal.Buffer = nil

local function OpenNew()
	local current = vim.fn.getcwd()

	vim.cmd('terminal powershell -NoExit -Command Set-Location "' .. current .. '"')

	vim.b.focus_disable = true

	terminal.Buffer = vim.api.nvim_get_current_buf()
end

function terminal.Escape()
	local success, result = pcall(function()
		return vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "t", false)
	end)

	if success then
		vim.notify("Escaped the terminal.", "info", {
			title = "Terminal",
		})
	end
end

function terminal.Open()
	if terminal.IsWindowOpen == false then
		-- initiate window
		vim.cmd([[
			botright vnew
			vertical resize 45

			set wfh
			set wfw
		]])

		terminal.Window = vim.api.nvim_get_current_win()

		-- Open a new terminal window if no terminal buffer exists.
		-- Else, open that buffer instead.
		if not terminal.IsBufferOpen then
			OpenNew()
		else
			vim.cmd("buffer" .. terminal.Buffer)
		end
	end
end
function terminal.Close()
	if terminal.IsWindowOpen == true then
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
	terminal.IsWindowOpen = verifier.VerifyWindow(terminal.Window)
	terminal.IsBufferOpen = verifier.VerifyBuffer(terminal.Buffer)

	if terminal.IsWindowOpen == false or not terminal.IsWindowOpen then
		terminal.Open()
	else
		terminal.Close()
	end
end

return terminal
