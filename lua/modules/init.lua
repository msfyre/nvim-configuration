local init = {}

function init.applyTheme()
	local neovide_config = require("lua.config.neovide")

	vim.cmd.colorscheme(neovide_config.window.theme);
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

function init.applyHotkeys()
	local hotkeys = require("config.hotkeys")

	local keymaps = hotkeys.mappings

	vim.cmd("mapclear!")

	for mode, keymaps in pairs(keymaps) do
		local string_macros = require("lua.luaumacros.string_macros")

		local vim_mode = string_macros.split(mode)[1]

		for i, keymap in pairs(keymaps) do
			vim.keymap.set(vim_mode, keymap.hotkey, keymap.action)
		end
	end
end

function init.applyOverrides()
	-- Reset all
	vim.cmd("set all&");

	local overrides = require("lua.config.overrides")
	local success, neotree = pcall(function ()
		return require("neotree")
	end)

	if (overrides.disable_netrw and not success) then
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.notify("NetRW disabled.", "info", {
			title = "Overrides",
		});
	end
end

return init
