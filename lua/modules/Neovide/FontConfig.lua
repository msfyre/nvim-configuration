local verifier = require("modules.Utilities.Verifier")
local nvideConfig = require("config.Neovide") or nil

if nvideConfig == nil then
	return
end

local fontString = ""

if nvideConfig.font.fontface ~= nil and verifier.VerifyFont(nvideConfig.font.fontface) then
	fontString = nvideConfig.font.fontface
else
	fontString = "monospace"
end

if nvideConfig.font.fontsize ~= nil then
	fontString = fontString .. ":h" .. tostring(nvideConfig.font.fontsize)
else
	fontString = fontString .. ":h12"
end

if nvideConfig.font.bold == true then
	fontString = fontString .. ":b"
end

if nvideConfig.font.italicized == true then
	fontString = fontString .. ":i"
end

vim.o.guifont = fontString
