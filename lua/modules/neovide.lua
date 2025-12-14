local neovideConfig = require("lua.config.neovide")

local neovide = {}

function neovide.applyConfig()
	
    if type(neovideConfig) ~= "table" then
        return vim.notify("neovide: config.neovide did not return a table", vim.log.levels.ERROR)
    end

	local fontConfig = neovideConfig.font or {}
	local editorConfig = neovideConfig.editor or {}
	local windowConfig = neovideConfig.window or {}

	local function applyWindowConfig()
		if windowConfig.fullscreen ~= nil then
			vim.g.neovide_fullscreen = windowConfig.fullscreen
		end

		if fontConfig.fontface and fontConfig.fontsize then
			vim.g.neovide_font = string.format("%s:h%i", fontConfig.fontface, fontConfig.fontsize)
		end

		if fontConfig.antialias ~= nil then
			vim.g.neovide_antialiasing = fontConfig.antialias
		end

		if (windowConfig.bgtransparency ~= nil) then
			vim.g.neovide_normal_opacity = windowConfig.bgtransparency;
		end

		if (windowConfig.blurred ~= nil) then
			vim.g.neovide_window_blurred = windowConfig.blurred
		end
	end

	local function applyEditorConfig()
		if editorConfig.tabsize then
			vim.o.tabstop = editorConfig.tabsize
			vim.o.shiftwidth = editorConfig.tabsize
		end

		if editorConfig.useSpaces ~= nil then
			vim.o.expandtab = editorConfig.useSpaces
		end

		if editorConfig.wrapLines ~= nil then
			vim.o.wrap = editorConfig.wrapLines
		end

		if editorConfig.hideMouseWhenTyping ~= nil then
			vim.g.neovide_hide_mouse_when_typing = editorConfig.hideMouseWhenTyping
		end
	end

	local function applyFontConfig()
		local fontstr = "";

		if fontConfig.fontface then
			fontstr = fontConfig.fontface;
		end

		if fontConfig.fontsize then
			fontstr = string.format("%s:h%i", fontstr, fontConfig.fontsize);
		end

		if fontConfig.bold then
			fontstr = fontstr .. ":b";
		end

		if fontConfig.italicized then
			fontstr = fontstr .. ":i";
		end

		if fontConfig.antialias ~= nil then
			vim.g.neovide_antialiasing = fontConfig.antialias
		end

		if fontstr ~= "" then
			vim.o.guifont = fontstr;
		end
	end

	applyWindowConfig();
	applyFontConfig();
	applyEditorConfig();
end

return neovide
