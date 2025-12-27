-- set package.path to include the Neovim config directory
ConfigPath = vim.fn.stdpath("config")

local lua_paths = {
	ConfigPath .. "/?.lua",
	ConfigPath .. "/?/init.lua",
	ConfigPath .. "/lua/?.lua",
	ConfigPath .. "/lua/?/init.lua",
}

for _, p in ipairs(lua_paths) do
	if not string.find(package.path, p, 1, true) then
		package.path = p .. ";" .. package.path
	end
end

require("modules.Initialization.AutoCMDs")
