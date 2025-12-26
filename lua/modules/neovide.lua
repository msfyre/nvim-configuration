--!strict
local neovideConfig = require("lua.config.neovide")

local neovide = {}

function neovide.applyConfig()
	if type(neovideConfig) ~= "table" then
		return vim.notify("neovide: config.neovide did not return a table", vim.log.levels.ERROR)
	end

	local fontConfig = neovideConfig.font or {}
	local editorConfig = neovideConfig.editor or {}
	local windowConfig = neovideConfig.window or {}
	local textConfig = neovideConfig.text or {}

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

		if windowConfig.scroll_anim_length ~= nil then
			vim.g.neovide_scroll_animation_length = windowConfig.scroll_anim_length
		end
	end
	local function applyEditorConfig()
		if editorConfig.tabsize then
			vim.opt.tabstop = editorConfig.tabsize
			vim.opt.shiftwidth = editorConfig.tabsize
		end

		if editorConfig.useSpaces ~= nil then
			vim.opt.expandtab = editorConfig.useSpaces
		end

		if editorConfig.wrapLines ~= nil then
			-- uh...
			vim.opt.wrap = editorConfig.wrapLines
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
	local function applyTextConfig()
		if textConfig.comment_style ~= nil then
			if textConfig.comment_style == "bold" then
				vim.api.nvim_set_hl(0, "Comment", { bold = true })
			elseif textConfig.comment_style == "italic" then
				vim.api.nvim_set_hl(0, "Comment", { italic = true })
			elseif textConfig.comment_style == "bolditalic" then
				vim.api.nvim_set_hl(0, "Comment", { bold = true, italic = true })
			end
		end
	end

	applyWindowConfig()
	applyFontConfig()
	applyEditorConfig()
	applyTextConfig()
end

return neovide
