kmset = vim.keymap.set
vim.g.mapleader = " "

local vc = vim.cmd

kmset("n", "<leader>pv", vc.Ex)
kmset("n", "<leader>co", ":e ~/.config/nvim/<CR>")
kmset("n", "<leader>cr", ":so ~/.config/nvim/init.lua<CR>")

-- Move selected text
kmset("v", "J", ":m '>+1<CR>gv=gv")
kmset("v", "K", ":m '<-2<CR>gv=gv")


kmset("n", "J", "mzJ`z")
