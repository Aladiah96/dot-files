-- ~/.config/nvim/lua/plugins.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Rose Pine theme
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
	    require("rose-pine").setup({
		    variant = "moon",
		    disable_background = true,
		    disable_float_background = false,
		    styles = {
			    bold = true,
			    italic = false,
			    transparency = true
		    },
	    })
      vim.cmd("colorscheme rose-pine")
    end,
  },
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },
  -- Telescope (for fuzzy finding)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  -- WhichKey (for keybindings help)
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "volar", "ts_ls", "eslint" },
      })
      local lspconfig = require("lspconfig")
      lspconfig.volar.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.eslint.setup({})
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.formatting.prettier,
        },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true })
    end,
  },
  {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
    -- {
    --      "github/copilot.vim",
    --    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-cmdline",
      },
      config = function()
        local cmp = require("cmp")
        require("luasnip.loaders.from_vscode").lazy_load()
  
        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- For luasnip users.
          }, {
            { name = "buffer" },
          }),
        })
        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }),
        })
      end,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        ensure_installed = {
          "lua",
          "typescript",
          "javascript",
          "tsx",
          "json",
          "html",
          "css",
          "scss",
          "yaml",
          "jsonc",
          "tsx",
          "graphql",
          "bash",
          "python",
          -- "rust",
          "go",
          "java",
          -- "c",
          "vim",
          "dockerfile",
          -- "svelte",
          "vue",
          -- "kotlin",
          -- "erlang",
          "jsonc",
          "markdown",
          "sql",
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({})
    end,
  },
  {"mbbill/undotree"},
  {"mg979/vim-visual-multi"},
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  }
})
