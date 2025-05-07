-- Install lazy.vim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{"Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{out, "WarningMsg" },
			{"\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

-- Add lazy.vim to runtimepath
vim.opt.rtp:prepend(lazypath)

-- Set mappings
require("config.mappings")

-- Set vim options
require("config.options")

-- Set vim auto commands
require("config.autocmds")

-- Import .lua files from config plugins
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	}
})

