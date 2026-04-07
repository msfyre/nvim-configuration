return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            section_separators = {
                left = " |>",
                right = "<| ",
            },
        },
        sections = {
            lualine_a = { "branch" },
            lualine_b = { "filename" },
            lualine_c = {},
            lualine_x = { "filetype" },
            lualine_y = {},
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_x = {},
        },
    },
}
