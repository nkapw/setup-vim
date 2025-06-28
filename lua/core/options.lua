-- File: lua/core/options.lua
-- Pengaturan editor Neovim global

local opt = vim.opt -- untuk penulisan yang lebih singkat

-- Tampilan
opt.number = true             -- Tampilkan nomor baris
opt.relativenumber = true     -- Tampilkan nomor baris relatif
opt.termguicolors = true      -- Aktifkan warna 24-bit
opt.signcolumn = "yes"        -- Selalu tampilkan sign column agar tidak bergeser
opt.wrap = false              -- Jangan wrap baris

-- Indentasi
opt.tabstop = 4               -- Lebar tab 4 spasi
opt.softtabstop = 4           -- Lebar soft tab 4 spasi
opt.shiftwidth = 4            -- Lebar shift 4 spasi
opt.expandtab = true          -- Gunakan spasi, bukan karakter tab
opt.autoindent = true         -- Indentasi otomatis
opt.smartindent = true        -- Indentasi cerdas

-- Pencarian
opt.ignorecase = true         -- Abaikan case saat mencari
opt.smartcase = true          -- Gunakan case-sensitive jika ada huruf besar
opt.incsearch = true          -- Tampilkan hasil pencarian saat mengetik
opt.hlsearch = false          -- Jangan highlight semua hasil pencarian

-- Perilaku Editor
opt.scrolloff = 8             -- Jaga kursor 8 baris dari tepi atas/bawah
opt.sidescrolloff = 8         -- Jaga kursor 8 kolom dari tepi samping
opt.undofile = true           -- Simpan history undo ke file
opt.mouse = "a"               -- Aktifkan mouse di semua mode
opt.clipboard = "unnamedplus" -- Gunakan clipboard sistem
opt.splitright = true         -- Buka vertical split ke kanan
opt.splitbelow = true         -- Buka horizontal split ke bawah
opt.updatetime = 250          -- Waktu update untuk kursor (penting untuk plugin)

-- Backup dan Swap
opt.swapfile = false
opt.backup = false
opt.writebackup = false
