local init = {}

function init.applyTheme()
    vim.cmd.colorscheme "catppuccin"
end

function init.applyConfigs()
    local neovide = require("lua.modules.neovide")
    neovide.applyConfig()
end

function init.applyAutoCMDs()
    local events = require("events");

    for event, callbackfn in pairs(events) do
        vim.api.nvim_create_autocmd(event, {
            callback = callbackfn,
        })
    end
end

return init


