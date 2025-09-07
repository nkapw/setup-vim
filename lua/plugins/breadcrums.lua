-- File: ~/.config/nvim/lua/plugins/breadcrumbs.lua

return {
  -- Plugin nvim-navic untuk mengambil data lokasi dari LSP
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      lsp = {
        auto_attach = true,
      },
      -- Opsi untuk kustomisasi tampilan, misalnya ikon
      icons = {
        File = "󰈙 ",
        Module = " ",
        Namespace = "󰌗 ",
        Package = "Package ",
        Class = "󰌗 ",
        Method = "󰆧 ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = "Enum ",
        Interface = "󰌗 ",
        Function = "󰊕 ",
        Variable = "󰆧 ",
        Constant = "󰏿 ",
        String = "󰀬 ",
        Number = "󰎠 ",
        Boolean = "◩ ",
        Array = "󰅪 ",
        Object = "󰅩 ",
        Key = "󰌋 ",
        Null = "󰟢 ",
        EnumMember = " ",
        Struct = "󰌗 ",
        Event = " ",
        Operator = "󰆕 ",
        TypeParameter = "󰊄 ",
      },
    },
  },

  -- Plugin breadcrumbs.nvim untuk menampilkan data dari nvim-navic
  -- (Plugin ini tidak memerlukan konfigurasi tambahan, hanya perlu dimuat)
  {
    "LunarVim/breadcrumbs.nvim",
    dependencies = "SmiteshP/nvim-navic",
  },
}
