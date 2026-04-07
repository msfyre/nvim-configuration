return {
    "rcarriga/nvim-notify",
    opts = {
        render = "compact",
        top_down = false,
    },
    init = function()
        vim.notify = require("notify")
    end,
}
