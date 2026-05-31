-- ============================================================
-- NEOVIM CONFIGURATION
-- ============================================================
-- Manajer plugin : vim.pack (builtin, lihat :h vim.pack)
-- Dependensi     : git, ripgrep, xclip/xsel, nerd font
-- Cek kesehatan  : :checkhealth
-- ============================================================

-- ============================================================
-- OPTIONS
-- ============================================================

-- leader key harus di-set sebelum plugin dimuat
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- >> Tampilan
vim.opt.termguicolors  = true              -- true color support
vim.opt.number         = true              -- nomor baris absolut
vim.opt.relativenumber = true              -- nomor baris relatif (bantu navigasi hjkl)
vim.opt.cursorline     = true              -- highlight baris aktif
vim.opt.showmode       = false             -- mode sudah tampil di statusline
vim.opt.signcolumn     = "yes"             -- kolom tanda (git, diagnostik) selalu tampil
vim.opt.list           = true              -- tampilkan karakter whitespace
vim.opt.listchars      = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.wrap           = true              -- bungkus baris yang melebihi lebar layar

-- >> Perilaku editor
vim.opt.mouse       = "a"                  -- aktifkan mouse (resize split, klik dll)
vim.opt.clipboard   = "unnamedplus"        -- sinkron clipboard OS ↔ neovim
vim.opt.breakindent = true                 -- indent ikut saat baris dibungkus
vim.opt.undofile    = true                 -- simpan riwayat undo antar sesi
vim.opt.updatetime  = 250                  -- delay sebelum CursorHold event (ms)
vim.opt.timeoutlen  = 300                  -- delay tunggu sequence keymap (ms)
vim.opt.inccommand  = "split"              -- preview substitusi :%s secara live

-- >> Split window
vim.opt.splitright = true                  -- split vertikal: panel baru ke kanan
vim.opt.splitbelow = true                  -- split horizontal: panel baru ke bawah

-- >> Pencarian
vim.opt.ignorecase = true                  -- pencarian tidak case-sensitive...
vim.opt.smartcase  = true                  -- ...kecuali ada huruf kapital
vim.opt.hlsearch   = true                  -- highlight semua hasil pencarian

-- >> Indentasi & formatting
vim.opt.tabstop    = 2                     -- lebar tampilan tab = 2 spasi
vim.opt.shiftwidth = 2                     -- lebar indent (>> / <<) = 2 spasi
vim.opt.expandtab  = true                  -- konversi tab → spasi otomatis
vim.opt.textwidth  = 80                    -- batas lebar teks (untuk gq dll)

-- >> Diagnostik LSP
-- ikon tiap severity membutuhkan nerd font di terminal
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN]  = " ",
			[vim.diagnostic.severity.INFO]  = " ",
			[vim.diagnostic.severity.HINT]  = " ",
		},
	},
})

-- ============================================================
-- KEYMAPS (umum, non-plugin)
-- ============================================================
-- Catatan: keymap khusus plugin didefinisikan di blok plugin masing-masing.

-- >> General
vim.keymap.set("n", "<Esc>",        "<cmd>nohlsearch<CR>", { desc = "Hapus highlight pencarian" })
vim.keymap.set("i", "jk",           "<Esc>",               { desc = "Keluar insert mode" })
vim.keymap.set({ "n", "v" }, ";",   ":",                   { desc = "Command mode (tanpa Shift)" })

-- >> Window: navigasi antar panel
-- konsisten dengan keymap terminal mode di blok toggleterm
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Pindah window kiri" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Pindah window bawah" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Pindah window atas" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Pindah window kanan" })

-- >> Window: split & tutup  (prefix <leader>w, terdaftar di which-key)
vim.keymap.set("n", "<leader>wv", "<C-w>v",  { desc = "[W]indow split [V]ertikal" })
vim.keymap.set("n", "<leader>ws", "<C-w>s",  { desc = "[W]indow [S]plit horizontal" })
vim.keymap.set("n", "<leader>wc", "<C-w>c",  { desc = "[W]indow [C]lose" })
vim.keymap.set("n", "<leader>wo", "<C-w>o",  { desc = "[W]indow [O]nly (tutup lainnya)" })
vim.keymap.set("n", "<leader>w=", "<C-w>=",  { desc = "[W]indow samakan ukuran" })

-- >> Window: resize  (Ctrl + tombol panah)
vim.keymap.set("n", "<C-Up>",    "<cmd>resize +2<CR>",          { desc = "Perbesar tinggi window" })
vim.keymap.set("n", "<C-Down>",  "<cmd>resize -2<CR>",          { desc = "Perkecil tinggi window" })
vim.keymap.set("n", "<C-Left>",  "<cmd>vertical resize -2<CR>", { desc = "Perkecil lebar window" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Perbesar lebar window" })

-- ============================================================
-- PLUGINS
-- ============================================================

-- ------------------------------------------------------------
-- Colorscheme: catppuccin
-- https://github.com/catppuccin/nvim
-- ------------------------------------------------------------
vim.cmd.colorscheme("catppuccin")

-- ------------------------------------------------------------
-- Syntax highlight: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
-- Parsing berbasis AST untuk highlighting yang akurat & cepat.
-- Tambah bahasa: tambahkan string ke tabel ensure_installed.
-- ------------------------------------------------------------
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { confirm = false })
require("nvim-treesitter.install").update("all") -- setara :TSUpdate

require("nvim-treesitter").setup({
	sync_install    = true,
	modules         = {},
	ignore_install  = {},
	ensure_installed = { "lua", "c", "rust", "go" },
	auto_install    = true,  -- install parser otomatis saat buka filetype baru
	highlight       = { enable = true },
})

-- ------------------------------------------------------------
-- Completion: blink.cmp
-- https://github.com/saghen/blink.cmp
-- Engine auto-completion dengan dukungan LSP, snippet, dan fuzzy.
-- ------------------------------------------------------------
vim.pack.add({ "https://github.com/saghen/blink.cmp" }, { confirm = false })

require("blink.cmp").setup({
	completion = {
		documentation = { auto_show = true },
	},
	fuzzy = { implementation = "lua" },
	keymap = {
		["<C-n>"]     = { "select_next", "fallback_to_mappings" },
		["<C-p>"]     = { "select_prev", "fallback_to_mappings" },
		["<C-y>"]     = { "select_and_accept", "fallback" },
		["<C-e>"]     = { "cancel", "fallback" },
		["<Tab>"]     = { "snippet_forward", "select_next", "fallback" },
		["<S-Tab>"]   = { "snippet_backward", "select_prev", "fallback" },
		["<CR>"]      = { "select_and_accept", "fallback" },
		["<Esc>"]     = { "cancel", "hide_documentation", "fallback" },
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-b>"]     = { "scroll_documentation_up", "fallback" },
		["<C-f>"]     = { "scroll_documentation_down", "fallback" },
		["<C-k>"]     = { "show_signature", "hide_signature", "fallback" },
	},
})

-- ------------------------------------------------------------
-- LSP: nvim-lspconfig + mason
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/mason-org/mason.nvim
--
-- Mason mengelola instalasi LSP server secara otomatis.
-- Untuk menambah server baru: tambahkan ke tabel lsp_servers.
-- Cek server aktif: :checkhealth vim.lsp
-- Lihat daftar server tersedia: :h lspconfig-all
-- ------------------------------------------------------------
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
}, { confirm = false })

local lsp_servers = {
	lua_ls = {
		-- referensi: https://luals.github.io/wiki/settings/
		Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) } },
	},
	gopls = {
		cmd          = { "gopls" },
		filetypes    = { "go", "gomod", "gowork", "gotmpl" },
		root_markers = { "go.work", "go.mod", ".git" },
		settings     = {
			gopls = {
				gofumpt     = true,
				staticcheck = true,
				hints = {
					assignVariableTypes    = true,
					compositeLiteralFields = true,
					compositeLiteralTypes  = true,
					constantValues         = true,
					functionTypeParameters = true,
					parameterNames         = true,
					rangeVariableTypes     = true,
				},
			},
		},
	},
}

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = vim.tbl_keys(lsp_servers),
})

-- keymap LSP dipasang per-buffer saat server attach
local function on_attach(_, bufnr)
	local map  = vim.keymap.set
	local opts = function(desc) return { buffer = bufnr, desc = desc } end

	-- navigasi kode
	map("n", "gd", vim.lsp.buf.definition,    opts("LSP: [G]o to [D]efinition"))
	map("n", "gD", vim.lsp.buf.declaration,   opts("LSP: [G]o to [D]eclaration"))
	map("n", "gr", vim.lsp.buf.references,    opts("LSP: [G]o to [R]eferences"))
	map("n", "gi", vim.lsp.buf.implementation, opts("LSP: [G]o to [I]mplementation"))
	map("n", "K",  vim.lsp.buf.hover,          opts("LSP: Hover dokumentasi"))

	-- aksi kode  (prefix <leader>c, terdaftar di which-key)
	map("n", "<leader>cf", vim.lsp.buf.format,      opts("LSP: [C]ode [F]ormat"))
	map("n", "<leader>rn", vim.lsp.buf.rename,      opts("LSP: [R]e[n]ame simbol"))
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts("LSP: [C]ode [A]ction"))

	-- diagnostik
	map("n", "<leader>ld", vim.diagnostic.open_float, opts("LSP: [L]ihat [D]iagnostik baris"))
	map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end,                                          opts("LSP: Diagnostik sebelumnya"))
	map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end,                                           opts("LSP: Diagnostik berikutnya"))
	map("n", "[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, opts("LSP: Error sebelumnya"))
	map("n", "]e", function() vim.diagnostic.jump({ count = 1,  severity = vim.diagnostic.severity.ERROR }) end, opts("LSP: Error berikutnya"))
end

for server, config in pairs(lsp_servers) do
	vim.lsp.config(server, { settings = config, on_attach = on_attach })
	vim.lsp.enable(server)
end

-- ------------------------------------------------------------
-- Fuzzy finder: telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim
-- Pencarian file, buffer, teks, help, dll. Prefix: <leader>f
-- ------------------------------------------------------------
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",        -- dependensi wajib
	"https://github.com/nvim-tree/nvim-web-devicons",  -- ikon (butuh nerd font)
	"https://github.com/nvim-telescope/telescope.nvim",
}, { confirm = false })

require("telescope").setup({})

local pickers = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", pickers.find_files,  { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", pickers.live_grep,   { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fw", pickers.grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fb", pickers.buffers,     { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fr", pickers.resume,      { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>fh", pickers.help_tags,   { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fm", pickers.man_pages,   { desc = "[F]ind [M]anuals" })
vim.keymap.set("n", "<leader>fp", pickers.builtin,     { desc = "[F]ind builtin [P]ickers" })

-- ------------------------------------------------------------
-- File explorer: nvim-tree
-- https://github.com/nvim-tree/nvim-tree.lua
-- netrw dinonaktifkan agar tidak konflik dengan nvim-tree.
-- Harus di-set SEBELUM plugin dimuat.
-- ------------------------------------------------------------
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-tree.lua" } })

require("nvim-tree").setup({
	view = { adaptive_size = true },        -- lebar panel menyesuaikan isi
	update_focused_file = { enable = true }, -- highlight file aktif di tree
	sync_root_with_cwd  = true,             -- root tree ikuti cwd neovim
	respect_buf_cwd     = true,
})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, { desc = "Toggle file [E]xplorer" })

-- ------------------------------------------------------------
-- Statusline: lualine.nvim
-- https://github.com/nvim-lualine/lualine.nvim
-- ------------------------------------------------------------
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" }, { confirm = false })

require("lualine").setup({
	options = {
		section_separators   = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
})

-- ------------------------------------------------------------
-- Formatter: conform.nvim
-- https://github.com/stevearc/conform.nvim
-- Format otomatis saat simpan file. Fallback ke LSP jika
-- formatter eksternal tidak tersedia.
-- Tambah formatter: pastikan binary-nya terinstall di sistem.
-- ------------------------------------------------------------
vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })

require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua        = { "stylua" },
		json       = { "jq" },
		rust       = { "rustfmt" },
		python     = { "black" },
		go         = { "goimports", "gofumpt" },
		html       = { "prettier" },
		javascript = { "prettier" },
	},
})

-- ------------------------------------------------------------
-- Git: gitsigns.nvim
-- https://github.com/lewis6991/gitsigns.nvim
-- Tampilkan perubahan git di signcolumn dan blame di baris aktif.
-- ------------------------------------------------------------
vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim" } })

require("gitsigns").setup({
	current_line_blame = true,
})

-- ------------------------------------------------------------
-- Terminal: toggleterm.nvim
-- https://github.com/akinsho/toggleterm.nvim
--
-- Buka/tutup : <C-\>  (aktif di normal, insert, dan terminal mode)
-- Multi terminal: ketik nomor sebelum <C-\>  → misal 2<C-\> = terminal #2
-- Ganti direction: :ToggleTerm direction=float|vertical|horizontal
-- Lihat semua terminal aktif: :TermSelect
-- ------------------------------------------------------------
vim.pack.add({ { src = "https://github.com/akinsho/toggleterm.nvim" } })

require("toggleterm").setup({
	open_mapping      = [[<c-\>]],
	insert_mappings   = true,   -- <C-\> aktif di insert mode
	terminal_mappings = true,   -- <C-\> aktif dari dalam terminal
	autochdir         = true,   -- terminal mengikuti cwd neovim
	hide_numbers      = true,
	start_in_insert   = true,
	direction         = "horizontal",
	size              = 15,     -- tinggi terminal (baris) untuk mode horizontal
	close_on_exit     = true,
	float_opts = {
		border   = "curved",
		winblend = 3,
	},
})

-- navigasi dari dalam terminal ke window lain tanpa keluar neovim
vim.keymap.set("t", "<Esc>",  [[<C-\><C-n>]],        { desc = "Keluar terminal mode" })
vim.keymap.set("t", "<C-h>",  [[<Cmd>wincmd h<CR>]], { desc = "Window kiri" })
vim.keymap.set("t", "<C-j>",  [[<Cmd>wincmd j<CR>]], { desc = "Window bawah" })
vim.keymap.set("t", "<C-k>",  [[<Cmd>wincmd k<CR>]], { desc = "Window atas" })
vim.keymap.set("t", "<C-l>",  [[<Cmd>wincmd l<CR>]], { desc = "Window kanan" })

-- ------------------------------------------------------------
-- UI helpers
-- ------------------------------------------------------------

-- which-key: popup daftar keymap saat menekan prefix (<leader> dll)
-- https://github.com/folke/which-key.nvim
vim.pack.add({ "https://github.com/folke/which-key.nvim" }, { confirm = false })

require("which-key").setup({
	spec = {
		{ "<leader>f", group = "[F]ind" },
		{ "<leader>w", group = "[W]indow" },
		{ "<leader>c", group = "[C]ode" },
	},
})

-- autopairs: tutup bracket/quote otomatis saat mengetik
-- https://github.com/windwp/nvim-autopairs
--
-- todo-comments: highlight komentar TODO / FIXME / NOTE / WARN / BUG / HACK
-- https://github.com/folke/todo-comments.nvim
vim.pack.add({
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/folke/todo-comments.nvim",
}, { confirm = false })

require("nvim-autopairs").setup()
require("todo-comments").setup()

-- vim.pack.update() -- hapus komentar untuk update semua plugin sekaligus
