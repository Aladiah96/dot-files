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

-- Accept copilot suggestion with <Tab>
map("i", "<Tab>", 'copilot#Accept("<Tab>")', { expr = true, silent = true })
