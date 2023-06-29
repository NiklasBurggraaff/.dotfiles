local NiklasBurggraaf_Fugitive = vim.api.nvim_create_augroup("NiklasBurggraaf_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = NiklasBurggraaf_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>k", function()
            vim.cmd.Git("push")
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>j", function()
            vim.cmd.Git({"pull"})
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        -- vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})
