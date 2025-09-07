-- File: /home/imam/.config/nvim/lua/core/lsp.lua
-- Konfigurasi LSP dengan perbaikan pada pemanggilan Telescope

local M = {}

local function on_attach(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local gopts = { noremap = true, silent = true }

    -- === FUNGSI UTAMA: GO TO PREVIEW & FUNGSI BAWAAN ===
    -- Keymap untuk Go To Preview
    local glance = require("glance")
    vim.keymap.set("n", "gd", function() glance.open("definitions") end, { desc = "Glance Definitions" })
    vim.keymap.set("n", "gr", function() glance.open("references") end, { desc = "Glance References" })
    vim.keymap.set("n", "gi", function() glance.open("implementations") end, { desc = "Glance Implementations" })
    vim.keymap.set("n", "gt", function() glance.open("type_definitions") end, { desc = "Glance Type Definitions" })


    -- Fungsi hover 'K'
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

    -- Keymaps LSP lainnya
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

    -- Diagnostic keymaps
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, gopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, gopts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, gopts)

    -- Inlay hints (jika didukung)
    if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
end
-- Part 2: Configure each language server
-------------------------------------------

-- Lua
vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
        }
    }
}

-- Go
vim.lsp.config['gopls'] = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    settings = {
        gopls = {
            gofumpt = true,
            staticcheck = true,
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
    on_attach = on_attach,
}

-- Python
vim.lsp.config['pyright'] = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', '.git' },
    on_attach = on_attach,
}

-- C/C++
vim.lsp.config['clangd'] = {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
    on_attach = on_attach,
}

-- Zig
vim.lsp.config['zls'] = {
    cmd = { 'zls' },
    filetypes = { 'zig' },
    root_markers = { 'build.zig', 'build.zig.zon', '.git' },
    on_attach = on_attach,
}

-- TypeScript (using the name 'ts_ls' as requested)
vim.lsp.config['ts_ls'] = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    on_attach = on_attach,
}

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
})
-- Part 3: Enable the configurations
--------------------------------------
vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('zls')
vim.lsp.enable('ts_ls')

return M
