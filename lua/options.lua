----------(options start)-----------
local opt = vim.opt

opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
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


