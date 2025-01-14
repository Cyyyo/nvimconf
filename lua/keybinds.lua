
vim.g.mapleader = ' '

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
-- /lua/keybinds.lua

vim.api.nvim_set_keymap("n", "<Leader>r", ":lua compile_and_run()<CR>", { noremap = true, silent = true })

