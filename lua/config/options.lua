-- <Tab> will use shiftwidth setting
vim.opt.smarttab = true
vim.opt.shiftwidth = 2

-- display line number
vim.opt.number = true
-- display relative line number (relative to your position)
vim.opt.relativenumber = true

-- instead of permitting operations that'll fail, e.g. :q with unsaved files
-- ask if you want to save the changes
vim.opt.confirm = true

-- keep the specified number of lines above and below the cursor
vim.opt.scrolloff = 10

-- when :vsplit or :split, go to a new buffer
vim.opt.splitright = true
vim.opt.splitbelow = true

-- case-insensitive search, unless prefixed with \C
vim.opt.ignorecase = true
-- case-sensitive search if capital letters occur
vim.opt.smartcase = true

-- keep undo history permamently
-- allows to undo things even after buffer closure
vim.opt.undofile = true

-- don't do any line wrapping
vim.opt.breakindent = false
vim.opt.wrap = false


-- sync clipboards between OS and Neovim 
-- NOTE: consider using vim.schedule if startup takes too long
vim.opt.clipboard = 'unnamedplus'

-- tree like style for file explorer
vim.g.netrw_liststyle = 3
