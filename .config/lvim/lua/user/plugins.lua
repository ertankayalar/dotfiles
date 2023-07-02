-- Additional Plugins
lvim.plugins = {
    -- 'wuelnerdotexe/vim-astro',
    "gpanders/editorconfig.nvim",
    {
        "aserowy/tmux.nvim",
        config = function() require("tmux").setup() end
    },
    --  "fatih/vim-go",
    "olexsmir/gopher.nvim",
    "j-hui/fidget.nvim",
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup {
                color_square_width = 2,
            }
        end,
    },
    "lvimuser/lsp-inlayhints.nvim",
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    "jose-elias-alvarez/typescript.nvim",
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup()
        end,
    },
    "mxsdev/nvim-dap-vscode-js",
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    "simrat39/rust-tools.nvim",
    {
        "saecki/crates.nvim",
        version = "v0.3.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup {
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
                popup = {
                    border = "rounded",
                },
            }
        end,
    },
    {
        "zbirenbaum/copilot.lua",
        -- event = { "VimEnter" },
        config = function()
            -- vim.defer_fn(function()
            require("copilot").setup {
                -- plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = "<C-a>",
                    },
                },
            }
            -- end, 100)
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup {
                formatters = {
                    insert_text = require("copilot_cmp.format").remove_existing,
                },
            }
        end,
    },


    -- surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- todo-comments
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

    -- Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    -- themes
    {
        'olivercederborg/poimandres.nvim',
        config = function()
            require('poimandres').setup {
                -- leave this setup function empty for default config
                -- or refer to the configuration section
                -- for configuration options
            }
        end
    },
    { "catppuccin/nvim",      name = "catppuccin", priority = 1000 },
    { "rebelot/kanagawa.nvim" },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { 'rose-pine/neovim', name = 'rose-pine' },
    -- { "Shatur/neovim-ayu" },
    -- { 'luisiacc/gruvbox-baby' },
    {
        "mcchrish/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim"
    },
    -- {
    --     'projekt0n/github-nvim-theme',
    --     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         require('github-theme').setup({
    --             --
    --         })

    --         -- vim.cmd('colorscheme github_dark')
    --     end,
    -- },
}
