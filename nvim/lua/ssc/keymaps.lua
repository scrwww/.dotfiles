vim.g.mapleader = " "
vim.g.maplocalleader = ','
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', '<S-h>', ':bprevious<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<S-l>', ':bnext<CR>', {noremap = true, silent = true})

vim.keymap.set('n', '<leader>pc', '<cmd> Telescope colorscheme<CR>', {noremap = true, silent = true})

-- useful asf
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
