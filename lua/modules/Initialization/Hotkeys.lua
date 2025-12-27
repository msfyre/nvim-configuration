local hotkeys = require("lua.config.hotkeys")

vim.cmd("mapclear!")

for i, keymap in pairs(hotkeys.mappings) do
	for i, mode in pairs(keymap.modes) do
		vim.keymap.set(mode, keymap.hotkey, keymap.action)
	end
end
