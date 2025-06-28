-- File: lua/plugins/treesitter.lua
-- Konfigurasi Syntax Highlighting

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Daftar parser bahasa yang akan diinstal
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"go",
				"python",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
			},

			-- Sinkronisasi instalasi (disarankan)
			sync_install = false,

			-- Aktifkan highlighting
			highlight = {
				enable = true,
			},

			-- Aktifkan indentasi berbasis treesitter
			indent = { enable = true },
		})
	end,
}
