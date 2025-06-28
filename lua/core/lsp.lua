-- File: lua/core/lsp.lua
-- Konfigurasi LSP global atau bawaan Neovim

-- Konfigurasi tampilan diagnostik (ini adalah pengaturan global, jadi cocok di sini)
vim.diagnostic.config({
    virtual_text = { prefix = "●" },
    float = { border = "rounded" },
})

-- Anda bisa mengaktifkan Language Server bawaan di sini jika tidak menggunakan mason/lspconfig
vim.lsp.enable("gopls") -- Hanya jika tidak dikelola oleh mason-lspconfig