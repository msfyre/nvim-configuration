local macros = {}

-- Escape magic characters so Lua sees them as normal characters
local function escape_pattern(s)
    return (s:gsub("(%W)", "%%%1"))
end

---@param str string
---@param delimiter string? default: ""
function macros.split(str, delimiter)
    local result = {}

    -- If no delimiter given → split into characters
    if not delimiter or delimiter == "" then
        for c in str:gmatch(".") do
            table.insert(result, c)
        end
        return result
    end

    local safe_delim = escape_pattern(delimiter)
    local pattern = "(.-)" .. safe_delim

    local last_end = 1
    local start_pos, end_pos, cap = str:find(pattern, 1)

    while start_pos do
        if cap ~= "" then
            table.insert(result, cap)
        end
        last_end = end_pos + 1
        start_pos, end_pos, cap = str:find(pattern, last_end)
    end

    -- Add the last segment
    local last = str:sub(last_end)
    if last ~= "" then
        table.insert(result, last)
    end

    return result
end

return macros
