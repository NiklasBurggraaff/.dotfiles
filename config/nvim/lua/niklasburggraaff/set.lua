local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Apearance
opt.termguicolors = true
opt.background = "dark"
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.isfname:append("@-@")
-- Give more space for displaying message
opt.cmdheight = 1

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append("c")

-- Consider - part of a word
opt.iskeyword:append("-")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 50

