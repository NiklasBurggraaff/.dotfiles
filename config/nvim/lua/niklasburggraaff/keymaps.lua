M = {}
main_functions = {}

-- [[ Keymaps ]]

local function vim_keymaps()
    -- Keymaps for better default experience
    vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

    -- Navigation
    vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Scroll down" })
    vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Scroll up" })
    vim.keymap.set("n", "n", "nzzzv", { silent = true, desc = "Move to next match" })
    vim.keymap.set("n", "N", "Nzzzv", { silent = true, desc = "Move to previous match" })

    -- Use Ctrl-c to escape (helps when using visual block insert mode)
    vim.keymap.set("i", "<C-c>", "<Esc>")

    vim.keymap.set("n", "x", [["_x]], { desc = "Cut without yanking" })

    vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to OS clipboard" })
    vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to OS clipboard" })

    vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

    vim.keymap.set("n", "?", "<cmd>Glow $XDG_CONFIG_HOME/nvim/README.md<cr>", { desc = "Help" })
    vim.keymap.set("n", "<leader>?", "<cmd>Glow $XDG_CONFIG_HOME/nvim/README.md<cr>", { desc = "Help" })

    -- Replace word under cursor
    vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubstitute" })
    -- NOTE: Keymaps for treesitter (plugins/treesitter.lua)

    -- NOTE: Keymaps for lsp (plugins/lsp.lua)
    -- NOTE: Keymaps for completion (plugins/cmp.lua)
    -- NOTE: Keymaps for telescope (plugins/telescope.lua)


    vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>", { desc = "[U]ndotree" })
end

table.insert(main_functions, vim_keymaps)


M.oil_keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    ["<C-h>"] = false,  -- harpoon
    ["<C-t>"] = false,  -- no tabs
    ["<C-p>"] = false,  -- project
    ["<C-a>"] = "actions.preview",
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["q"] = { "actions.close", mode = "n" },
    ["<C-r>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g/"] = { "actions.toggle_trash", mode = "n" },
}


local function project_keymaps()
    local telescope_builtin = require("telescope.builtin")
    -- Project navigation
    vim.keymap.set("n", "-", "<cmd>Oil<cr>")
    vim.keymap.set("n", "<leader>pv", "<cmd>Oil<cr>", { desc = "[P]roject [V]iew" })
    vim.keymap.set("n", "<C-p>", telescope_builtin.git_files, { desc = "[P]roject git files" })
    vim.keymap.set("n", "<leader>po", telescope_builtin.oldfiles, { desc = "[P]roject [O]ld files" })
    vim.keymap.set("n", "<leader>pf", telescope_builtin.find_files, { desc = "[P]roject [F]ind files" })
    vim.keymap.set("n", "<leader>ps", function()
        telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "[P]roject [S]earch" })
    vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<C-t>", telescope_builtin.resume, { desc = "[T]elescope resume" })
end

table.insert(main_functions, project_keymaps)

-- Keymaps for harpoon
local function harpoon_keymaps()
    local harpoon = require("harpoon")
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "[A]dd file to harpoon" })
    vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {
        desc = "Toggle [H]arpoon menu"
    })
    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, {
        desc = "Navigate to file 1 (h) in harpoon"
    })
    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, {
        desc = "Navigate to file 2 (j) in harpoon"
    })
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, {
        desc = "Navigate to file 3 (k) in harpoon"
    })
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, {
        desc = "Navigate to file 4 (l) in harpoon"
    })
end

table.insert(main_functions, harpoon_keymaps)

-- Help tags
local function vim_tools_keymaps()
    local telescope_builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>vh", telescope_builtin.help_tags, { desc = "[V]im [H]elp telescope "})
    vim.keymap.set("n", "<leader>vz", ":Lazy <CR>", { desc = "[V]im La[z]y" })
    vim.keymap.set("n", "<leader>vm", ":Mason <CR>", { desc = "[V]im [M]ason" })
    vim.keymap.set("n", "<leader>vl", ":LspInfo <CR>", { desc = "[V]im [L]spInfo" })

    -- Debugging
    vim.keymap.set("n", "<leader>vst", "<cmd>StartupTime<cr>", { desc = "Show [S]tartup [T]ime" })
end

table.insert(main_functions, vim_tools_keymaps)

local function git_keymaps()
    -- Git keymaps
    vim.keymap.set("n", "<leader>gd", "<Cmd>Gvdiffsplit<CR>", { desc = "[G]it [D]iff" })
    vim.keymap.set("n", "<leader>gs", "<Cmd>Neogit<CR>", { desc = "[G]it [S]tatus" })
    vim.keymap.set("n", "<leader>gb", "<Cmd>GitBlameToggle<CR>", { desc = "[G]it [B]lame" })
end

table.insert(main_functions, git_keymaps)

M.git_signs_keymaps = function(bufnr)
    vim.keymap.set("n", "<leader>gp", require("gitsigns").prev_hunk,
        { buffer = bufnr, desc = "[G]it go to [P]revious Hunk" })
    vim.keymap.set("n", "<leader>gn", require("gitsigns").next_hunk,
        { buffer = bufnr, desc = "[G]it go to [N]ext Hunk" })
    vim.keymap.set("n", "<leader>gh", require("gitsigns").preview_hunk,
        { buffer = bufnr, desc = "[G]it preview [H]unk" })
end

M.lsp_keymaps = function(bufnr)
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    -- See `:help K` for why this keymap
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<leader>K", vim.lsp.buf.signature_help, "Signature Documentation")

    -- Lesser used LSP functionality
    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
    nmap("<leader>f", "<Cmd>Format<cr>", "[F]ormat file")
end

local function refactor_keymaps()
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

    vim.api.nvim_set_keymap("n", "<leader>rbf",
        [[ <Cmd>lua require("refactoring").refactor("Extract Block To File")<CR>]],
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
end

table.insert(main_functions, refactor_keymaps)

local function diagnostics_keymaps()
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

    vim.keymap.set("n", "<leader>td", require("telescope.builtin").diagnostics, { desc = "[T]elescope [D]iagnostics" })
    vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "[T]elescope [T]odo" })
end

table.insert(main_functions, diagnostics_keymaps)


M.debugging_keymaps = function(dap, dapui)
    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set("n", "<F5>", dap.continue)
    vim.keymap.set("n", "<F1>", dap.step_into)
    vim.keymap.set("n", "<F2>", dap.step_over)
    vim.keymap.set("n", "<F3>", dap.step_out)
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
    end)

    -- toggle to see last session result. Without this ,you can"t see session output in case of unhandled exception.
    vim.keymap.set("n", "<F7>", dapui.toggle)
end


M.main = function()
    for _, f in pairs(main_functions) do
        f()
    end
end

return M
