vim.g.mapleader = " "
vim.g.maplocalleader = ','

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', '<S-h>', ':bprevious<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<S-l>', ':bnext<CR>', {noremap = true, silent = true})

vim.keymap.set('n', '<leader>pc', '<cmd> Telescope colorscheme<CR>', {noremap = true, silent = true})

-- useful asf
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

