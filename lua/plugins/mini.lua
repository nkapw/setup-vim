-- File: ~/.config/nvim/lua/plugins/mini.lua
return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.basics").setup()
      require("mini.pairs").setup()
      require("mini.comment").setup();
      require("mini.indentscope").setup({ symbol = '│' })
      require("mini.hues").setup({ background = "#1e1e1e", foreground = "#d4d4d4" })
      require("mini.ai").setup()
      require("mini.fuzzy").setup()
      require("mini.pick").setup()
    end,
  },
}
