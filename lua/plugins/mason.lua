return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = true,
            ensure_installed = { "omnisharp", "clangd", "rust_analyzer", "systemd_lsp", "ts_ls" },
        },
        dependencies = {
            {
                "mason-org/mason.nvim",
                lazy = false,
                opts = {},
            },
            "neovim/nvim-lspconfig",
        },
        init = function()
            local installed_servers = require("mason-lspconfig").get_installed_servers()

            for _, server in ipairs(installed_servers) do
                local server_config = server_config_module.get_server_config(server)

                vim.lsp.config(server, server_config)
                vim.lsp.enable(server)
            end
        end,
    },
}
