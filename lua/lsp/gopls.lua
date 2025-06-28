-- File: nvim/lua/lsp/gopls.lua
-- Konfigurasi khusus untuk Go Language Server (gopls)

return {
    -- Tambahkan pengaturan Gopls spesifik di sini jika ada.
    -- Misalnya:
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
    root_markers = { 'go.mod', '.git', 'go.work' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
}