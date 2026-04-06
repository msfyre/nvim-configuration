return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = true,
      ensure_installed = {"omnisharp", "clangd", "rust_analyzer", "systemd_lsp", "ts_ls"}
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {}
      },
      "neovim/nvim-lspconfig"
    }
  }
}
