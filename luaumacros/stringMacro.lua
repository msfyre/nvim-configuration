---!strict

local stringMacro = {}

local function escape_pattern(str)
    return (str:gsub("(%W)", "%%%1"))
end

---@param str string
---@param delimiter string
function stringMacro.split(str, delimiter)
    local result = {}

    if delimiter == "" then
        for c in str:gmatch(".") do
            table.insert(result, c)
        end
        return result
    end

    local safe_delim = escape_pattern(delimiter)
    local pattern = "([^" .. safe_delim .. "]+)"

    for match in string.gmatch(str, pattern) do
        table.insert(result, match)
    end

    return result
end

---@param strarray table
---@param separator string
function stringMacro.concat(strarray, separator)
	local result = ""

	for i, str in ipairs(strarray) do
		result = result .. str .. separator
	end

	return result
end

return stringMacro