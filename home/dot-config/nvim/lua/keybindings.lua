-- ~/.config/nvim/lua/keybindings.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle file tree with <Space> + Shift + E
map("n", "<Leader>E", ":NvimTreeToggle<CR>", opts)

-- Open Copilot chat with <Space> + Alt + I
map("n", "<Leader><A-i>", ":Copilot<CR>", opts)

-- Fuzzy find files with <Space> + Shift + P (similar to Ctrl + Shift + P in VSCode)
map("n", "<Leader>P", ":Telescope find_files<CR>", opts)

-- Search in files with <Space> + Shift + F (similar to Ctrl + Shift + F in VSCode)
map("n", "<Leader>F", ":Telescope live_grep<CR>", opts)

-- Keep Neovim's default bindings like / for search
map("n", "/", "/", opts)

-- For shift-tab to dedent in normal and visual mode
map("n", "<S-Tab>", "<<", opts)
map("v", "<S-Tab>", "<gv", opts)
map("i", "<S-Tab>", "<C-d>", opts)

-- Yank to system clipboard
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })

-- Paste from system clipboard
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'P', '"+P', { noremap = true, silent = true })
