vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "turn off highlighted search" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "[W]rite File" })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "[W]rite File And [Q]uit" })

vim.keymap.set("n", "e", "<cmd>Ex<CR>", { desc = "Open File [E]xplorer" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
