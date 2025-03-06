-- ~/.config/nvim/lua/keybindings.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle file tree with <Space> + Shift + E
map("n", "<Leader>E", ":NvimTreeToggle<CR>", opts)

-- Open Copilot chat with <Space> + Alt + I
map("n", "<Leader><A-i>", ":Copilot<CR>", opts)

-- Fuzzy find files with <Space> + Shift + P (similar to Ctrl + Shift + P in VSCode)
map("n", "<Leader>p", ":Telescope find_files<CR>", opts)

-- Search in files with <Space> + Shift + F (similar to Ctrl + Shift + F in VSCode)
map("n", "<Leader>F", ":Telescope live_grep<CR>", opts)

-- Keep Neovim's default bindings like / for search
map("n", "/", "/", opts)

-- For shift-tab to dedent in normal and visual mode
map("n", "<S-Tab>", "<<", opts)
map("v", "<S-Tab>", "<gv", opts)
map("i", "<S-Tab>", "<C-d>", opts)

-- Yank to system clipboard
map('n', 'y', '"+y', opts)
map('v', 'y', '"+y', opts) 

-- Paste from system clipboard
map('n', 'p', '"+p', opts)
map('n', 'P', '"+P', opts)

-- Tmux Navigator overrides
map('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', opts)
map('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', opts)
map('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', opts)
map('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', opts)
