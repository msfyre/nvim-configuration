local neovideConfig = require("lua.config.Neovide")

local windowConfig = neovideConfig.window or {}

local module = {}

function module.Apply()
	if windowConfig.fullscreen ~= nil then
		vim.g.neovide_fullscreen = windowConfig.fullscreen
	end

	if windowConfig.bgtransparency ~= nil then
		vim.g.neovide_normal_opacity = windowConfig.bgtransparency
	end

	if windowConfig.blurred ~= nil then
		vim.g.neovide_window_blurred = windowConfig.blurred
	end

	if windowConfig.scroll_anim_length ~= nil then
		vim.g.neovide_scroll_animation_length = windowConfig.scroll_anim_length
	end

	if windowConfig.cursor_anim_length ~= nil then
		vim.g.neovide_cursor_animation_length = windowConfig.cursor_anim_length
	end
end

return module

