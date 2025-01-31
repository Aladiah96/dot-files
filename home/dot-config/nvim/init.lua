vim.g.mapleader = " " -- Set leader key to space

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "80"

-- Load plugins
require("plugins")

-- Load keybindings
require("keybindings")
