local module = {}

function module.Apply()
	local neovideConfig = require("lua.config.Neovide")

	local fontConfig = neovideConfig.font or {}

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
		local config_success, result = pcall(function()
			vim.o.guifont = fontstr
		end)

		if config_success then
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

return module
