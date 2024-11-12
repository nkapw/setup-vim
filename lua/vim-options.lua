vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader = " "

local o = vim.opt
o.number = true
o.relativenumber = true

o.hlsearch = true
vim.keymap.set("n", "<CR>", "<CMD>nohlsearch<CR>")

-- maps --

-- quit
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>")

-- save
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>")

-- exit insert mode
vim.keymap.set("i", "jj", "<ESC>")

vim.keymap.set("n", ";", ":")

-- copy to clipboard
vim.keymap.set({ "n", "x", "o" }, "gy", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "x", "o" }, "gp", '"+p', { desc = "Paste clipboard text" })

-- New Windows
vim.keymap.set("n", "<leader>o", "<CMD>vsplit<CR>")
vim.keymap.set("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

-- Resize Windows
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Right>", "<C-w>>")
vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Down>", "<C-w>-")
