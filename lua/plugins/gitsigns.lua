return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})	

			vim.keymap.set('n', '<leader>gh', gitsigns.blame, { desc = "[G]it [H]istory" })
			vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = "[G]it [B]lame" })
			vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = "[G]it [P]review" })
		end
			
	},
}
