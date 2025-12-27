local hotkeys = require("lua.config.Hotkeys")

vim.cmd("mapclear!")

for i, keymap in pairs(hotkeys.mappings) do
	if keymap.modes == nil or keymap.action == nil then
		goto continue
	end

	for i, mode in pairs(keymap.modes) do
		vim.keymap.set(mode, keymap.hotkey, keymap.action)
	end

	::continue::
end
