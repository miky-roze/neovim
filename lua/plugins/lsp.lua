return {
  "neovim/nvim-lspconfig",
  enabled = false,
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", version = "*" },
    'saghen/blink.cmp'
  },
  config = function()
    local lsps = { "lua_ls", "gopls", "ts_ls", "bashls" }

    require("fidget").setup({})
    require("mason").setup({})
    require("mason-lspconfig").setup({ ensure_installed = lsps })

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    vim.lsp.config("*", { capabilities = capabilities } )
  end
}
