-- File: ~/.config/nvim/lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "go", "gomod", "gosum", "gowork", "lua", "vim", "bash" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
