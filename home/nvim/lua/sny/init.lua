require("sny.remap")
require("sny.packer")

local vo = vim.opt
local vc = vim.cmd
local vw = vim.wo

-- Setip title
vo.title = true

-- vc.colorscheme "catppuccin-mocha"
vc.colorscheme "bogster"

vo.shell = "bash"

vo.textwidth = 80

-- Tabs and Spaces
vo.tabstop = 4
vo.shiftwidth = 4
vo.cursorline = true
-- vo.softtabstop = 4
-- vo.expandtab = true
-- vo.smartindent = true

-- Line numbers
vw.number = true
vw.relativenumber = true

-- Undo and backups
vo.swapfile = false
vo.backup = false
vo.undodir = os.getenv("HOME") .. "/.vim/undodir"
vo.undofile = true

-- Colors
vo.termguicolors = true

-- Misc
vo.scrolloff = 5
vo.updatetime = 50
vo.clipboard = "unnamedplus"
