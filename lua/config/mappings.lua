-- [LEADER KEY]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- [HIGHLIGHTING]
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- [DIAGNOSTICS]
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- [OTHER]
map("n", "<leader>q", "<cmd>q<CR>", { desc = "[Q]uit" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "[W]rite" })

map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- [NAVIGATION]
-- See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
