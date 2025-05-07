return {
	-- Examples:
	-- 	gcc - (un)comment line
	-- 	gc - (un)comment target of a motion, e.g.
	-- 	gcap - (un)comment around paragraph
	{
		"tpope/vim-commentary",
	},
	
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local comments = require("todo-comments")

			comments.setup({
				signs = false
			})

			vim.keymap.set("n", "]c", function() comments.jump_next() end, { desc = "Jump to next [C]omment" })
			vim.keymap.set("n", "[c", function() comments.jump_prev() end, { desc = "Jump to previous [C]omment" })
			vim.keymap.set("n", "<leader>td", ":TodoQuickFix<CR>", { desc = "Get [T]o-[D]o comments in quickfix list" })
		end
	},
}

