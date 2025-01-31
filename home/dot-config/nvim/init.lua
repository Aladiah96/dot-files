vim.g.mapleader = " " -- Set leader key to space

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- Load plugins
require("plugins")

-- Load keybindings
require("keybindings")
