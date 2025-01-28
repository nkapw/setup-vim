return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {

        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "gopls", "yamlls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local on_attach = function(client, bufnr)
                -- format on save
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("Format", { clear = true }),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.rescriptls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.yamlls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            vim.keymap.set({ "n", "i" }, ",;", vim.lsp.buf.hover, {})
            -- Auto-hover on CursorHold
            -- vim.api.nvim_create_autocmd("CursorHoldI", {
            --   pattern = "*",
            -- callback = function()
            --   vim.lsp.buf.hover()
            --  end,
            --})
            -- Close hover documentation
            local function close_hover_window()
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local config = vim.api.nvim_win_get_config(win)
                    if config.relative ~= "" then -- Check if it's a floating window
                        vim.api.nvim_win_close(win, true) -- Close the floating window
                        return
                    end
                end
            end
            vim.keymap.set("n", "<Esc>", close_hover_window, { noremap = true, silent = true })
            vim.opt.updatetime = 300 -- Time in milliseconds
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
            vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})
        end,
    },
}
