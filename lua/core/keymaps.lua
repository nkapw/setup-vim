-- File: lua/core/keymaps.lua
-- Pemetaan tombol global

local map = vim.keymap.set

-- Set Leader key ke Spasi
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", ";", ":")
map("n", "<CR>", "<CMD>nohlsearch<CR>")

map({ "n", "x", "o" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
map({ "n", "x", "o" }, "<leader>p", '"+p', { desc = "Paste clipboard text" })

-- Mode Normal
-- Navigasi window
map("n", "<C-h>", "<C-w>h", { desc = "Pindah ke window kiri" })
map("n", "<C-l>", "<C-w>l", { desc = "Pindah ke window kanan" })
map("n", "<C-j>", "<C-w>j", { desc = "Pindah ke window bawah" })
map("n", "<C-k>", "<C-w>k", { desc = "Pindah ke window atas" })

-- Ubah ukuran window
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Perkecil window vertikal" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Perbesar window vertikal" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Perkecil window horizontal" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Perbesar window horizontal" })

-- File Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Buka/Tutup File Explorer" })
map("n", "<leader>r", ":NvimTreeFocus<CR>", { desc = "Fokus ke File Explorer" })

-- Terminal
map("n", "<leader>t", ":terminal<CR>", { desc = "Buka Terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Keluar dari mode Terminal" })

-- === PENAMBAHAN KEYMAP TELESCOPE ===
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Cari File" })
-- map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Cari Teks (Live Grep)" })
-- map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Cari Buffer" })
-- map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Cari Bantuan" })

map("n", "<leader>ff", function() require("mini.pick").builtin.files() end, { desc = "Cari File" })
map("n", "<leader>fg", function() require("mini.pick").builtin.grep_live() end,
  { desc = "Cari Teks (Live Grep)" })
map("n", "<leader>fb", function() require("mini.pick").builtin.buffers() end, { desc = "Cari Buffer" })
map("n", "<leader>fh", function() require("mini.pick").builtin.help() end, { desc = "Cari Bantuan" })

-- Mode Visual
-- Pindahkan baris yang dipilih ke atas/bawah
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Pindahkan ke bawah" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Pindahkan ke atas" })

map("n", "q", ":close<CR>", {})
