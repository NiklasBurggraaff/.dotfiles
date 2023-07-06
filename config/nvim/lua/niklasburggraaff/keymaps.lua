-- [[ Keymaps ]]

-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Scroll up" })
vim.keymap.set("n", "n", "nzzzv", { silent = true, desc = "Move to next match" })
vim.keymap.set("n", "N", "Nzzzv", { silent = true, desc = "Move to previous match" })

-- Use Ctrl-c to escape (helps when using visual block insert mode)
vim.keymap.set("i", "<C-c>", "<Esc>")

-- NOTE: Keymaps for treesitter (plugins/treesitter.lua)

-- NOTE: Keymaps for lsp (plugins/lsp.lua)
-- NOTE: Keymaps for completion (plugins/cmp.lua)
-- NOTE: Keymaps for telescope (plugins/telescope.lua)

-- Don't yank on cut
vim.keymap.set("n", "x", [["_x]], { desc = "Cut without yanking" })

-- Format file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format file" })

-- NOTE: Undotree (plugins-setup.lua)

-- Project navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pr", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = "[/] Fuzzily search in current buffer" })
vim.keymap.set("n", "<C-t>", builtin.resume, { desc = "[T]elescope resume" })

-- Keymaps for harpoon
vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file, { desc = "[A]dd file to harpoon" })
vim.keymap.set("n", "<C-h>", require("harpoon.ui").toggle_quick_menu, { desc = "Toggle [H]arpoon menu" })
vim.keymap.set("n", "<C-j>", function() require("harpoon.ui").nav_file(1) end, {
    desc = "Navigate to file 1 (j) in harpoon"
})
vim.keymap.set("n", "<C-k>", function() require("harpoon.ui").nav_file(2) end, {
    desc = "Navigate to file 2 (k) in harpoon"
})
vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(3) end, {
    desc = "Navigate to file 3 (l) in harpoon"
})
vim.keymap.set("n", "<C-;>", function() require("harpoon.ui").nav_file(4) end, {
    desc = "Navigate to file 4 (;) in harpoon"
})

-- Help tags
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

-- Git keymaps
-- NOTE: Git keymaps setup for neogit, git-blame, and gitsigns (plugins-setup.lua)

-- Copy OS clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Keymaps for refactor
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require("refactoring").refactor("Extract Function")<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[R]efactor [E]xtract function" })
vim.api.nvim_set_keymap("v", "<leader>rf",
    [[ <Esc><Cmd>lua require("refactoring").refactor("Extract Function To File")<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[R]efactor extract function to [F]ile" })
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require("refactoring").refactor("Extract Variable")<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[R]efactor extract [V]ariable" })

-- Extract block doesn"t need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require("refactoring").refactor("Extract Block")<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[R]efactor extract [B]lock" })

vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require("refactoring").refactor("Extract Block To File")<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[R]efactor extract [B]lock to [F]ile" })

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require("refactoring").refactor("Inline Variable")<CR>]],
    { noremap = true, silent = true, expr = false, desc = "[R]efactor [I]nline variable" })

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
    "v",
    "<leader>rr",
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    { noremap = true, desc = "[R]efactor [R]efactoring menu" }
)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xs", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>")

-- My help
vim.keymap.set("n", "?", "<cmd>Glow $XDG_CONFIG_HOME/nvim/README.md<cr>")
vim.keymap.set("n", "<leader>?", "<cmd>Glow $XDG_CONFIG_HOME/nvim/README.md<cr>")
