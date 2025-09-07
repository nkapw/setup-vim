-- File: ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "gopls", "gofumpt", "goimports" }
    }
  },
}
