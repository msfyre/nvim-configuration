local nvideConfig = require("config.Neovide") or nil

if nvideConfig == nil then
	return
end

if nvideConfig.window.fullscreen ~= nil then
	vim.g.neovide_fullscreen = nvideConfig.window.fullscreen
end

if nvideConfig.window.bgtransparency ~= nil then
	vim.g.neovide_normal_opacity = 1 - nvideConfig.window.bgtransparency
end

-- Animation lengths
if nvideConfig.window.cursor_anim_length ~= nil then
	vim.g.neovide_cursor_animation_length = nvideConfig.window.cursor_anim_length
end

if nvideConfig.window.scroll_anim_length ~= nil then
	vim.g.neovide_scroll_animation_length = nvideConfig.window.scroll_anim_length
end
