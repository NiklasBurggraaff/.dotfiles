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

local function shorten_filenames(filenames)
    local shortened = {}

    local counts = {}
    for _, file in ipairs(filenames) do
        local name = vim.fn.fnamemodify(file.filename, ":t")
        counts[name] = (counts[name] or 0) + 1
    end

    for _, file in ipairs(filenames) do
        local name = vim.fn.fnamemodify(file.filename, ":t")

        if counts[name] == 1 then
            table.insert(shortened, { filename = vim.fn.fnamemodify(name, ":t") })
        else
            table.insert(shortened, { filename = file.filename })
        end
    end

    return shortened
end

require("lazy").setup({
    -- Lua utilities
    "nvim-lua/plenary.nvim",

    -- Dashboard when opening neovim
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup {
                -- config
            }
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } }
    },

    -- Directory tree
    {
        "prichrd/netrw.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            use_devicons = true,
        },
    },
    {
        "ThePrimeagen/harpoon",
        opts = {
            tabline = true,
            tabline_prefix = "  ",
            tabline_suffix = "  ",
        }
    },


    {
        -- Set lualine as statusline
        "nvim-lualine/lualine.nvim",
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = true,
                theme = require("lualine.themes.penumbra-dark+"),
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { { "mode", fmt = function(s) return mode_map[s] or s end } },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
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
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
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
            on_attach = function(bufnr)
                vim.keymap.set("n", "<leader>gp", require("gitsigns").prev_hunk,
                    { buffer = bufnr, desc = "[G]it go to [P]revious Hunk" })
                vim.keymap.set("n", "<leader>gn", require("gitsigns").next_hunk,
                    { buffer = bufnr, desc = "[G]it go to [N]ext Hunk" })
                vim.keymap.set("n", "<leader>gh", require("gitsigns").preview_hunk,
                    { buffer = bufnr, desc = "[G]it preview [H]unk" })
            end,
        },
    },
    "f-person/git-blame.nvim",

    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",
    -- Detect editorconfig
    "gpanders/editorconfig.nvim",
    -- Fix tabs and spaces
    { "tenxsoydev/tabs-vs-spaces.nvim", config = true },

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
        opts = {
            signs = {
                error = " ",
                warning = " ",
                hint = " ",
                information = " ",
                other = " ",
            },
        },
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

    -- Easier macros
    {
        "chrisgrieser/nvim-recorder",
        opts = {},
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
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
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
        end
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

    -- Markdown preview
    {
        "ellisonleao/glow.nvim",
        config = {
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
        opts = {},
    },

    "ThePrimeagen/refactoring.nvim",

    -- Add column when code is too long
    {
        "m4xshen/smartcolumn.nvim",
        opts = {
            colorcolumn = "80",
            disabled_filetypes = { "help", "netrw", "lazy", "mason", "undotree", "text" },
            custom_colorcolumn = {},
            scope = "file",
        }
    },

    -- Colorful parenthesis matching
    "HiPhish/nvim-ts-rainbow2",

    -- Automatically close brackets
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    "windwp/nvim-ts-autotag",

    -- Highlight colors
    {
        "NvChad/nvim-colorizer.lua",
        opts = {}
    },
    "roobert/tailwindcss-colorizer-cmp.nvim",

    -- Practice vim
    "ThePrimeagen/vim-be-good",

    -- AI
    "github/copilot.vim",

    -- Time tracking
    "wakatime/vim-wakatime",

    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        keys = { { "<leader>st", "<cmd>StartupTime<cr>", desc = "Show [S]tartup [T]ime" } },
        config = function()
            vim.g.startuptime_event_width = 64
        end,
    },
}, {
    ui = {
        border = "rounded",
    },
})
