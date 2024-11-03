vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader= " "

local o = vim.opt
o.number = true
o.relativenumber = true


o.hlsearch = true
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")


-- maps --

-- quit
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>")

-- save
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>")

-- exit insert mode
vim.keymap.set("i", "jj", "<ESC>")

vim.keymap.set("n", ";", ":")
