return {
  "hrsh7th/nvim-cmp",
  lazy = true,
  event = "InsertEnter",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",

    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",

    -- Snippet engine
    "L3MON4D3/LuaSnip"
  },
  config = function()
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert(
        {
          ['<Down>'] = {
            i = cmp.mapping.select_next_item(),
          },
          ['<Up>'] = {
            i = cmp.mapping.select_prev_item(),
          },
          ['<Tab>'] = {
            i = function()
              if cmp.visible() then
                cmp.select_next_item()
              else
                cmp.complete()
              end
            end,
          },
          ['<S-Tab>'] = {
            i = function()
              if cmp.visible() then
                cmp.select_prev_item()
              else
                cmp.complete()
              end
            end,
          },
          ['<CR>'] = {
            i = cmp.mapping.confirm({ select = true }),
          },
          ['<C-e>'] = {
            i = cmp.mapping.abort(),
          },
        }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" }
      }
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities
    })

    vim.schedule(function()
      for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
        local server_config = server_config_module.get_server_config(server)
        server_config["capabilities"] = capabilities

        vim.lsp.config(server, server_config)
        vim.lsp.enable(server)
      end
    end)
  end
}
