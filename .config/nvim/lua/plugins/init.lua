return {
    -- NOTE: First, some plugins that don't require any configuration

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },



    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'lewis6991/gitsigns.nvim',

    { "rockyzhang24/arctic.nvim", dependencies = { "rktjmp/lush.nvim" } },
    -- {
    --     'nvim-lualine/lualine.nvim',
    --     -- dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    --     dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- },


    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
--    'numToStr/Comment.nvim',               -- "gc" to comment visual regions/lines
    'tpope/vim-sleuth',                    -- Detect tabstop and shiftwidth automatically

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim' }
    },

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.executable 'make' ==
            1
    },

    {
        "folke/which-key.nvim",
        config = function()
         vim.o.timeout = true
        vim.o.timeoutlen = 300
            require("which-key").setup({})
        end
    },

    'wuelnerdotexe/vim-astro',

    -- tmux
    {
        "aserowy/tmux.nvim",
        config = function() require("tmux").setup() end
    },

    {
         'numToStr/Comment.nvim',
         config = function()
        require('Comment').setup({
         --   ignore = '^$',
            toggler = {
                line = '<leader>cc',
                block = '<leader>bc',
            },
            opleader = {
                line = '<leader>c',
                block = '<leader>b',
            },
        })
         end
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
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config       = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

    -- themes

    "EdenEast/nightfox.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    { 'rose-pine/neovim', name = 'rose-pine' },


    -- Snippets
{
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	-- build = "make install_jsregexp"
},
    "rafamadriz/friendly-snippets",
}
