-- File: ~/.config/nvim/lua/core/utils.lua

local M = {}

--- Menggabungkan path file relatif dengan breadcrumbs dari nvim-navic
function M.get_full_winbar()
  -- Dapatkan path file relatif terhadap direktori kerja
  local file_path = vim.fn.expand("%:p:.")

  -- Dapatkan breadcrumbs dari nvim-navic
  -- Parameter { highlight = true } akan membuat nvim-navic tidak menampilkan nama file
  local location = require("nvim-navic").get_location({ highlight = true })

  -- Jika tidak ada lokasi (misalnya file kosong atau bukan file kode),
  -- tampilkan path file saja.
  if location == "" then
    return "" .. file_path
  end

  -- Gabungkan path file dengan breadcrumbs
  return "" .. file_path .. " > " .. location
end

return M
