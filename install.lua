#!/usr/bin/lua

local name = "nvim-linux-x86_64.tar.gz"
local path = "https://github.com/neovim/neovim/releases/download/v0.11.0/"
local target = "/opt/nvim"

-- download neovim archive from repo
local ok, exit = os.execute("curl -LO " .. path .. name)
if not ok then os.exit(-1) end

-- remove old version
local ok, exit = os.execute("sudo rm -rf " .. target)
if not ok then os.exit(-1) end

-- recreate target directory
local ok, exit = os.execute("sudo mkdir -p " .. target)
if not ok then os.exit(-1) end

-- extract archive to target dir
local ok, exit = os.execute("sudo tar -C " .. target .. " -xf " .. name)
if not ok then os.exit(-1) end
