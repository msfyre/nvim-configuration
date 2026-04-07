local M = {}

---@param theme string
function M.load_theme(theme)
    local success, result = pcall(function()
        return vim.cmd("colorscheme " .. theme)
    end)

    if not success then
        print(result)
    end
end

return M
