return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "OXY2DEV/markview.nvim" },
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.config")

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
					"hcl",
					"markdown",
					"markdown_inline"
				},
				auto_install = false,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
}
