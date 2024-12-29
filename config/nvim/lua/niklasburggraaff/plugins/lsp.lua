require('lspconfig.ui.windows').default_options.border = "single"

-- [[ Configure LSP ]]
--    This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    require("niklasburggraaff.keymaps").lsp_keymaps(bufnr)
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Enable the following language servers
--    Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--    Add any additional override configuration in the following tables. They will be passed to
--    the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    clangd = {},
    pyright = {},

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
        },
    },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded"
  }
)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}

require'lspconfig'.svelte.setup{}

-- Setup neovim lua configuration
require("neodev").setup()
