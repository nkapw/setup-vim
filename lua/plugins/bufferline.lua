-- File: lua/plugins/bufferline.lua
-- Konfigurasi Bufferline (tab)

return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- bisa juga 'tabs'
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true
          }
        }
      }
    })
  end
}
