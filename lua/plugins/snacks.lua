return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    notify = { enabled = true, },
    notifier = {
      enabled = true,
      timeout = 10000,
      top_down = false
    },
    picker = { enabled = true }
  }
}
