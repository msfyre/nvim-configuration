local neovide_config = require("lua.config.neovide")

local applySuccess, result = pcall(function()
    return vim.cmd.colorscheme(neovide_config.window.theme)
end)

if not applySuccess then
    vim.notify(result, "error", {
        title = "Theme failed to apply!",
    })
end