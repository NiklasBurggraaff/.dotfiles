-- [[ Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Copied from ThePrimeagen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "x", [["_x]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndotree" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Copy OS clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Keymaps for harpoon
vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
vim.keymap.set("n", "<C-h>", require("harpoon.ui").toggle_quick_menu)

vim.keymap.set("n", "<C-j>", function() require("harpoon.ui").nav_file(1) end, {
	desc = "Navigate to file 1 in harpoon"
})
vim.keymap.set("n", "<C-k>", function() require("harpoon.ui").nav_file(2) end, {
	desc = "Navigate to file 2 in harpoon"
})
vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(3) end, {
	desc = "Navigate to file 3 in harpoon"
})
vim.keymap.set("n", "<C-;>", function() require("harpoon.ui").nav_file(4) end, {
	desc = "Navigate to file 4 in harpoon"
})

-- Keymaps for refactor
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require("refactoring").refactor("Extract Function")<CR>]],
	{ noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap("v", "<leader>rf",
	[[ <Esc><Cmd>lua require("refactoring").refactor("Extract Function To File")<CR>]],
	{ noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require("refactoring").refactor("Extract Variable")<CR>]],
	{ noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require("refactoring").refactor("Inline Variable")<CR>]],
	{ noremap = true, silent = true, expr = false })

-- Extract block doesn"t need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require("refactoring").refactor("Extract Block")<CR>]],
	{ noremap = true, silent = true, expr = false })

vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require("refactoring").refactor("Extract Block To File")<CR>]],
	{ noremap = true, silent = true, expr = false })

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require("refactoring").refactor("Inline Variable")<CR>]],
	{ noremap = true, silent = true, expr = false })

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? \"gk\" : \"k\"", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? \"gj\" : \"j\"", { expr = true, silent = true })

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
