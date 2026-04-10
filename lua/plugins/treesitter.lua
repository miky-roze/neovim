return {
  'nvim-treesitter/nvim-treesitter',
  enabled = false,
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'bash', 'go', 'javascript', 'typescript', 'sql', 'dockerfile', 'json', 'yaml', 'hcl' },
      sync_install = false,
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
