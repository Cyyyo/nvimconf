----------(options start)-----------
local opt = vim.opt
vim.g.mapleader = " "

opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.scrolloff = 10
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default registe

opt.splitright = true
opt.splitbelow = true
----------(options end)-----------


