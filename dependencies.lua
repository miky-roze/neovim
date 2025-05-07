#!/usr/bin/lua

-- install ripgrep (dependency for telescope)
local ok = os.execute("sudo apt-get install ripgrep")
if not ok then os.exit(-1) end

-- install fd-find and link it to fd
local ok = os.execute("sudo apt install fd-find")
if not ok then os.exit(-1) end

-- NOTE: Rememver to add $HOME/.local/bin to $PATH
local ok = os.execute("ln -s $(which fdfind) ~/.local/bin/fd")
