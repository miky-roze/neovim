vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "turn off highlighted search" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "[W]rite File" })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "[W]rite File And [Q]uit" })

-- navi between neovim and terminal windows
-- TODO: figure out how to comeback from terminal to neovim window
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "go to right window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "go to top window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "go to bottom window" })
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "go to left window" })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "go to right window" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "go to top window" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "go to bottom window" })


vim.keymap.set("n", "e", "<cmd>Ex<CR>", { desc = "Open File [E]xplorer"})

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
