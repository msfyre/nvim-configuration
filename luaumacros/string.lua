---!strict

local stirngmod = require("string")

local string = {}

---@param str string
---@param delimiter string
function string.split(str, delimiter)
	local result = {}

	for match in stirngmod.gmatch(str, "([^" .. delimiter .. "]+)") do
		table.insert(result, match);
	end

	return result
end

---@param strarray table
---@param separator string
function string.concat(strarray, separator)
	local result = ""

	for i, str in ipairs(strarray) do
		result = result .. str .. separator
	end

	return result
end

return string