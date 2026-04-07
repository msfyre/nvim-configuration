local M = {}

local lsp_configs = {
    ["lua_ls"] = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = "vim",
                },
                workspace = {
                    checkThirdParty = false,
                    library = { "/usr/share/nvim/runtime" },
                },
                runtime = { version = "LuaJIT" },
                telemetry = { enable = false },
            },
        },
    },
}

--- @param server_name string
--- @return table
function M.get_server_config(server_name)
    if lsp_configs[server_name] ~= nil then
        return lsp_configs[server_name]
    else
        return {}
    end
end

return M
