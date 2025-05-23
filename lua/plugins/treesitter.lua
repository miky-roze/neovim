return {
	{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { 
						"lua",
						"bash",
						"dockerfile",
						"go",
						"gomod",
						"gosum",
						"gotmpl",
						"gowork",
						"json",
						"yaml",
						"make",
						"sql",
						"terraform"
					},
					auto_install = false,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
	}
}
