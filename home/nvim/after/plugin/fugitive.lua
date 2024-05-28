local kmset = vim.keymap.set
local vc = vim.cmd

kmset("n", "<leader>gs", vc.Git)
kmset("n", "<leader>gp", ":Git push origin master")
