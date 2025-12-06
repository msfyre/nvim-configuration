local Events = {}

local function onNewTab()
	vim.api.nvim_create_autocmd(
		"TabNew",
		{
			callback = function ()
				windowModule.ShowFileTree();
			end
		}
	)
end

local function beforeVimClose()
	vim.api.nvim_create_autocmd(
		"VimLeavePre",
		{
			callback = function ()
				print("Goodbye :(")
			end
		}
	)
end

function Events.onVimRun()
	windowModule.ShowWelcome();
	
	vim.schedule(function()
		windowModule.PrepareWindow();
	end)
end

function Events.Initialize()
	onNewTab();
	beforeVimClose();
end

return Events