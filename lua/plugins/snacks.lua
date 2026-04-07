return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
        "nvim-mini/mini.icons",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        picker = { enabled = true },
        words = { enabled = true },
    },
}
