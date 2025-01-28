vim.g.mapleader = " " -- Set leader key to space

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Load plugins
require("plugins")

-- Load keybindings
require("keybindings")
