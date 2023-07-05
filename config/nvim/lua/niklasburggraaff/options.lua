-- [[ Setting options ]]
-- See `:help vim.o`

-- Set color scheme
vim.cmd.colorscheme("penumbra-dark+")
vim.o.termguicolors = true

-- Only have one status line
vim.opt.laststatus = 3

-- Make relative line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Tabs and indentation
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Save undo history
vim.o.undofile = true

-- Don't save backup and swap files
vim.o.swapfile = false
vim.o.backup = false

-- Ensure lines below and above cursor
vim.o.scrolloff = 8

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Split right and below
vim.o.splitright = true
vim.o.splitbelow = true

-- Plugins
vim.g.gitblame_enabled = 0

vim.diagnostic.config {
    float = { border = "rounded" },
}
