-- File: lua/plugins/lsp.lua

return {
  {
    "williamboman/mason.nvim",
    config = true, -- Mengaktifkan konfigurasi default Mason
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- Tidak perlu konfigurasi di sini, ini hanya penghubung
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvimdev/lspsaga.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- Untuk capabilities
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig") -- Diperlukan untuk mengakses setup()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Muat autocmd LSP yang telah dipisahkan (mengandung on_attach dan keymaps)
      require("core.autocmds")

      -- Setup Mason untuk mengelola instalasi server
      mason_lspconfig.setup({
        -- Daftar server yang ingin diinstal Mason secara otomatis
        ensure_installed = {
          "lua_ls",
          "tsserver", -- Dikoreksi: ini adalah nama yang digunakan oleh Mason untuk TypeScript
          "gopls",
          "pyright",
          "rust_analyzer", -- Dikoreksi: ini adalah nama yang digunakan oleh Mason untuk Rust
        },
        automatic_installation = true,

        -- Gunakan setup_handlers untuk mengintegrasikan nvim-lspconfig
        -- Ini akan memanggil lspconfig.<server_name>.setup() untuk setiap server yang diinstal Mason.
        -- nvim-lspconfig secara otomatis akan memuat konfigurasi dari lua/lsp/<server_name>.lua
        -- dan menggabungkannya dengan default, serta menambahkan 'capabilities' dan on_attach.
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              -- on_attach tidak perlu diteruskan di sini karena sudah ditangani autocmd LspAttach
              -- Namun, jika Anda memiliki server yang memerlukan on_attach kustom, Anda bisa menimpa handler ini
            })
          end,
        },
      })

      -- Aktifkan secara eksplisit Language Server yang Anda inginkan
      -- Neovim akan secara otomatis menemukan konfigurasi di lua/lsp/<nama_server>.lua
      -- dan menggabungkannya dengan apa yang disediakan lspconfig.
      vim.lsp.enable({"lua_ls", "tsserver", "gopls", "pyright", "rust_analyzer"})
    end,
  },
}