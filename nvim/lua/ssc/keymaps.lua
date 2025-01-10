vim.g.mapleader = " "
vim.g.maplocalleader = ','
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', '<S-h>', ':bprevious<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<S-l>', ':bnext<CR>', {noremap = true, silent = true})
