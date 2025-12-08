local init = {}

function init.applyTheme()
	vim.cmd.colorscheme("catppuccin")
end

function init.applyConfigs()
	local neovide = require("lua.modules.neovim")
	neovide.applyConfig()
end

function init.applyAutoCMDs()
	local events = require("events")

	for event, callbackfn in pairs(events) do
		vim.api.nvim_create_autocmd(event, {
			callback = callbackfn,
		})
	end
end

function init.applyUserCMDs()
	local userCMDs = require("commands")

	for i, cmd in ipairs(userCMDs) do
		vim.api.nvim_create_usercmd(cmd.command, cmd.callback, {
			desc = cmd.config.description,
		})
	end
end

function init.applyHotkeys()
	local hotkeys = require("config.hotkeys")

	local keymaps = hotkeys.mappings

	for mode, keymaps in pairs(keymaps) do
		local string_macros = require("lua.luaumacros.string_macros")

		local vim_mode = string_macros.split(mode)[1]

		for i, keymap in pairs(keymaps) do
			vim.keymap.set(vim_mode, keymap.hotkey, keymap.action)
		end
	end

	vim.notify("Hotkeys ready!", "info", {
		title = "Hotkeys",
	})
end

return init
