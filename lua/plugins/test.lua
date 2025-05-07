return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { desc = "Run [T]est nearest coursor" }),
	vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { desc = "Run [T]ests in current file" }),
	vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { desc = "Run [Test] [L]ast run" }),
	vim.keymap.set("n", "<leader>v", ":TestVisit<CR>", { desc = "[V]isit test file of last run test" }),

	vim.cmd("let test#strategy = 'vimux'"),
}
