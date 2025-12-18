--!strict
local neovideConfig = require("lua.config.neovide")

local verifier = require("modules.verifier")

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

		if windowConfig.bgtransparency ~= nil then
			vim.g.neovide_normal_opacity = windowConfig.bgtransparency
		end

		if windowConfig.blurred ~= nil then
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
		local fontstr = fontConfig.fontface

		if fontConfig.fontsize ~= nil and type(fontConfig.fontsize) == "number" then
			fontstr = fontstr .. ":h" .. fontConfig.fontsize
		end


		if fontConfig.bold ~= nil and fontConfig.bold == true then
			fontstr = fontstr .. ":b"
		end

		if fontConfig.italicized ~= nil and fontConfig.italicized == true then
			fontstr = fontstr .. ":i"
		end

		if fontConfig.antialias ~= nil and fontConfig.antialias == false then
			fontstr = fontstr .. ":#e-alias"
		end

		if fontstr ~= "" or fontstr ~= nil then
			local success, result = pcall(function()
				vim.o.guifont = fontstr
			end)

			if success then
				vim.notify("Font: " .. fontConfig.fontface, "info", {
					title = "Font Config",
				})
			else
				vim.notify(result, "error", {
					title = "Font Config: Error!",
				})
			end
		end
	end

	applyWindowConfig()
	applyFontConfig()
	applyEditorConfig()
end

return neovide
