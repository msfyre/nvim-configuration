local neovimConfig = require("config.neovim")

local neovide = {}

function neovide.applyConfig()
	-- defensive checks
    if type(neovimConfig) ~= "table" then
        vim.notify("neovide: config.neovide did not return a table", vim.log.levels.ERROR)
        return
    end

	local fontConfig = neovimConfig.font or {}
	local editorConfig = neovimConfig.editor or {}
	local windowConfig = neovimConfig.window or {}
	local cursorConfig = neovimConfig.window.cursor or {}

	local function applyWindowConfig()
		if windowConfig.fullscreen ~= nil then
			vim.g.neovide_fullscreen = windowConfig.fullscreen;
		end
	end

	--- TODO: create a functional function that applies the cursor config in the editor
	--- (msfyre) 12/8/2025

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

		if windowConfig.fullscreen ~= nil then
			vim.g.neovide_fullscreen = windowConfig.fullscreen
		end

		if fontConfig.fontface and fontConfig.fontsize then
			vim.g.neovide_font = string.format("%s:h%i", fontConfig.fontface, fontConfig.fontsize)
		end

		if fontConfig.antialias ~= nil then
			vim.g.neovide_antialiasing = fontConfig.antialias
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
