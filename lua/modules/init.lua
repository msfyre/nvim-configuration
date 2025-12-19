local init = {}
function init.applyTheme()
	local neovide_config = require("lua.config.neovide")

	local applySuccess, result = pcall(function()
		return vim.cmd.colorscheme(neovide_config.window.theme)
	end)

	if not applySuccess then
		vim.notify(result, "error", {
			title = "Theme failed to apply!",
		})
	end
end

function init.applyConfigs()
	local neovide = require("lua.modules.neovide")
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
function init.appluUserCMDs()
	local commands = require("config.commands")

	for i, command in pairs(commands) do
		local success, result = pcall(function()
			return vim.api.nvim_create_user_command(command.name, command.action, {
				desc = command.desc,
			})
		end)

		if not success then
			vim.notify(result, "error", {
				title = "User CMD Error!",
			})
		end
	end
end

function init.applyHotkeys()
	local hotkeys = require("lua.config.hotkeys")

	vim.cmd("mapclear!")

	for i, keymap in pairs(hotkeys.mappings) do
		for i, mode in pairs(keymap.modes) do
			vim.keymap.set(mode, keymap.hotkey, keymap.action)
		end
	end
end

function init.applyOverrides()
	-- Reset all
	vim.cmd("set all&")

	local overrides = require("lua.config.overrides")
	local success, neotree = pcall(function()
		return require("neotree")
	end)

	if overrides.disable_netrw and not success then
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.notify("NetRW disabled.", "info", {
			title = "Overrides",
		})
	end
end

return init
