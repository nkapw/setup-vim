-- File: ~/.config/nvim/lua/core/options.lua

local opt = vim.opt

-- Tampilan & UI
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.scrolloff = 0
opt.cursorline = true
opt.winbar = "%{%v:lua.require('core.utils').get_full_winbar()%}"

-- Indentasi
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Pencarian
opt.ignorecase = true
opt.smartcase = true

-- Perilaku Editor
opt.wrap = true
opt.undofile = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.splitright = true
opt.splitbelow = true
