local set = vim.opt

-- Set indenting to 2 spaces
set.shiftwidth = 4
set.tabstop = 4

-- Make line numbers default
set.number = true
-- use relative line numbers, to help with jumping.
set.relativenumber = true

-- Don't show the mode, since it's already in the status line
set.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	set.clipboard = "unnamedplus"
end)

-- Enable break indent
set.breakindent = true

-- Save undo history
set.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
set.ignorecase = true
set.smartcase = true

-- Keep signcolumn on by default
set.signcolumn = "yes"

-- Decrease update time
set.updatetime = 250

-- Decrease mapped sequence wait time
set.timeoutlen = 300

-- Configure how new splits should be opened
set.splitright = true
set.splitbelow = true

-- Preview substitutions live, as you type!
set.inccommand = "split"

-- Show which line your cursor is on
set.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
set.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
set.confirm = true
