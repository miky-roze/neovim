return {
  "folke/trouble.nvim",
  enabled = false,
  opts = {
    focus = true,
    auto_preview = false,
    preview = {
      type = "float",
      relative = "editor",
      border = "rounded",
      title = "Preview",
      title_pos = "center",
      position = { 0, -2 },
      size = { width = 0.3, height = 0.3 },
      zindex = 200,
    },
  },
  cmd = "Trouble",
  keys = {
    { "<leader>da", "<cmd>Trouble diagnostics toggle<cr>" },
    { "<leader>db", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
    { "<leader>ds", "<cmd>Trouble symbols toggle focus=true<cr>" },
    { "<leader>dl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>" },
    { "<leader>dq", "<cmd>Trouble loclist toggle<cr>" },
    { "<leader>dQ", "<cmd>Trouble qflist toggle<cr>" }
  },
}
