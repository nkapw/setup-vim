-- File: lua/plugins/telescope.lua
-- Konfigurasi Fuzzy Finder

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- Tidak perlu konfigurasi khusus untuk setup sederhana,
		-- keymaps sudah diatur di core/keymaps.lua
		require("telescope").setup({})
	end,
}
