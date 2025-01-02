-- Install lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

local mode_map = {
    ["NORMAL"] = " ",
    ["O-PENDING"] = "N?",
    ["INSERT"] = " ",
    ["VISUAL"] = " ",
    ["V-BLOCK"] = "VB",
    ["V-LINE"] = "VL",
    ["V-REPLACE"] = "VR",
    ["REPLACE"] = "R ",
    ["COMMAND"] = " ",
    ["SHELL"] = " ",
    ["TERMINAL"] = " ",
    ["EX"] = "X ",
    ["S-BLOCK"] = "SB",
    ["S-LINE"] = "SL",
    ["SELECT"] = "S ",
    ["CONFIRM"] = "Y?",
    ["MORE"] = "M ",
}

require("lazy").setup({
    -- Lua utilities
    "nvim-lua/plenary.nvim",

    -- Dashboard when opening neovim
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup()
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Directory tree
    {
        "stevearc/oil.nvim",
        opts = {
            delete_to_trash = true,
            keymaps = require("niklasburggraaff.keymaps").oil_keymaps
        },
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },


    {
        -- Set lualine as statusline
        "nvim-lualine/lualine.nvim",
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = true,
                theme = require("lualine.themes.penumbra-dark+"),
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { { "mode", fmt = function(s) return mode_map[s] or s end } },
                lualine_b = { "branch", "diff" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "filetype" },
                lualine_y = { "diagnostics" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {}
            },
        },
    },

    -- Notifications
    "rcarriga/nvim-notify",

    -- Git related plugins
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gdiffsplit", "Gdiff", "Gvdiffsplit", "Gvdiff", "Gwrite", "Gw" },
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
            "echasnovski/mini.pick",         -- optional
        },
        opts = {
            kind = "split",
            disable_commit_confirmation = true,
            disable_insert_on_commit = false,
            commit_popup = {
                kind = "floating",
            },
        },
    },
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "|" },
            },
            on_attach = require("niklasburggraaff.keymaps").git_signs_keymaps
        },
    },
    {
        "f-person/git-blame.nvim",
    },

    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",

    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            {
                "williamboman/mason.nvim",
                config = true,
                opts = {
                    ui = {
                        border = "rounded",
                    }
                }
            },
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            { "j-hui/fidget.nvim", tag = "legacy", opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            "folke/neodev.nvim",
        },
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            mode = "document_diagnostics",
            signs = {
                error = " ",
                warning = " ",
                hint = " ",
                information = " ",
                other = " ",
            },
        },
        cmd = { "TroubleToggle", "Trouble" },
    },

    {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",

            -- Adds LSP completion capabilities
            "hrsh7th/cmp-nvim-lsp",

            -- Adds a number of user-friendly snippets
            "rafamadriz/friendly-snippets",
        },
    },

    -- Useful plugin to show you pending keybinds.
    {
        "folke/which-key.nvim",
        opts = {}
    },

    -- Updated wildmenu to be more useful
    {
        "gelguy/wilder.nvim",
        opts = {
            modes = { ":", "/", "?" },
        }
    },

    -- Add scrollbar
    {
        "dstein64/nvim-scrollview",
        opts = {
            signs_column = -2,
        },
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x"
    },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available.
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
            return vim.fn.executable "make" == 1
        end,
    },

    -- Easily undo changes
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = function()
            vim.g.undotree_WindowLayout = 4
            vim.g.undotree_SetFocusWhenToggle = 1
            vim.g.undotree_ShortIndicators = 1
        end,
    },

    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/playground",
        },
        build = ":TSUpdate",
    },

    {
        "davidmh/mdx.nvim",
        config = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" }
    },

    -- Markdown preview
    {
        "ellisonleao/glow.nvim",
        opts = {
            border = "rounded",
        },
        cmd = "Glow"
    },

    -- Comments
    {
        "numToStr/Comment.nvim",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        opts = {}
    },

    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = false,
        config = function()
            require("refactoring").setup()
        end,
    },

    -- Add column when code is too long
    {
        "m4xshen/smartcolumn.nvim",
        opts = {
            colorcolumn = { "80", "120" },
            disabled_filetypes = {
                "help", "netrw", "lazy", "mason", "undotree", "text", "dashboard"
            },
            custom_colorcolumn = {},
            scope = "file",
        }
    },

    -- Colorful parenthesis matching
    {
        "hiphish/rainbow-delimiters.nvim",
        config = function()
            vim.g.rainbow_delimiters = {
                highlight = {
                    "RainbowYellow",
                    "RainbowViolet",
                    "RainbowBlue",
                },
            }
        end,
    },

    -- Automatically close brackets
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
    "windwp/nvim-ts-autotag",

    -- Highlight colors
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            names = false
        }
    },
    "roobert/tailwindcss-colorizer-cmp.nvim",

    -- Practice vim
    "ThePrimeagen/vim-be-good",

    -- AI
    -- "github/copilot.vim",
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },

    -- Time tracking
    "wakatime/vim-wakatime",

    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_event_width = 64
        end,
    },
}, {
    ui = {
        border = "rounded",
    },
})
