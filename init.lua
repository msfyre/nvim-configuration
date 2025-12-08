-- set package.path to include the Neovim config directory
config_path = vim.fn.stdpath("config")

local lua_paths = {
	config_path .. "/?.lua",
	config_path .. "/?/init.lua",
	config_path .. "/lua/?.lua",
	config_path .. "/lua/?/init.lua",
}

for _, p in ipairs(lua_paths) do
	if not string.find(package.path, p, 1, true) then
		package.path = p .. ";" .. package.path
	end
end

--- Modules

-- Custom Modules
initMod = require("lua.modules.initMod")
neotree = require("lua.modules.neotree")

-- AutoCMDs
initMod.applyAutoCMDs()

-- Lazy
require("config.lazy")

-- Plugins
echo = require("echo")
