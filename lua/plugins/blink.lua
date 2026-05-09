return {
  'saghen/blink.cmp',
  enabled = false,
  version = '1.*',
  dependencies = {
    "folke/lazydev.nvim"
  },
  opts = {
    keymap = { preset = 'default' },
    completion = {
      documentation = { auto_show = false },
      menu = {
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind" } }
        }
      }
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
