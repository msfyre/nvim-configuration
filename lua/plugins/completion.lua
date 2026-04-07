return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    version = "*",
    opts = {
        keymap = {
            preset = "default",
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
        },
        appearance = { nerd_font_variant = "mono" },
        completion = { documentation = { auto_show = true, auto_show_delay_ms = 0 } },
        cmdline = {
            sources = function()
                local type = vim.fn.getcmdtype()

                -- Search completion
                if type == "/" or type == "?" then
                    return { "buffer" }
                end

                -- Command completion
                if type == ":" then
                    return { "path", "cmdline" }
                end

                return {}
            end,
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}
