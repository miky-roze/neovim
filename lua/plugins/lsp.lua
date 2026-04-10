return {
  "neovim/nvim-lspconfig",
  enabled = false,
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", version = "*" },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },
  config = function()
    local lsps = { "lua_ls", "gopls", "ts_ls" }

    require("fidget").setup({})
    require("mason").setup({})
    require("mason-lspconfig").setup({ ensure_installed = lsps })

    vim.lsp.config("lua_ls", {
      settings = { Lua = { diagnostics = { globals = { "vim" } } } }
    })

    local cmp = require("cmp")
    cmp.setup({
      window = {
	completion = cmp.config.window.bordered(),
	documentation = cmp.config.window.bordered()
      },
      mapping = cmp.mapping.preset.insert({
	["<C-n>"] = cmp.mapping.select_next_item(),
	["<C-p>"] = cmp.mapping.select_prev_item(),
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-q>"] = cmp.mapping.abort(),
	["<C-y>"] = cmp.mapping.confirm({ select = true })
      }),
      sources = cmp.config.sources(
	{ { name = "nvim_lsp" } },
	{ { name = "buffer" } },
	{ { name = "path" } },
	{ { name = "nvim-lsp-signature-help" } }
      )
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    for i in pairs(lsps) do
      vim.lsp.config(lsps[i], { capabilities = capabilities })
    end
  end
}
