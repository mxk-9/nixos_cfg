kmset = vim.keymap.set
vim.g.mapleader = " "

local vc = vim.cmd

kmset("n", "<leader>pv", vc.Ex)

-- Toggle wrap lines
kmset("n", "<leader>l", ":set wrap!<CR>")

-- No highlight
kmset("n", "<leader>n", ":noh<CR>")

-- Move selected text
kmset("v", "J", ":m '>+1<CR>gv=gv")
kmset("v", "K", ":m '<-2<CR>gv=gv")


kmset("n", "J", "mzJ`z")
