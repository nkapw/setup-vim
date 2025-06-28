-- File: nvim/lua/lsp/lua_ls.lua
-- Konfigurasi khusus untuk Lua Language Server

return {
	-- Pengaturan spesifik untuk lua_ls
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	-- Anda bisa menambahkan root_markers atau filetypes jika diperlukan
	-- Contoh:
	root_markers = { ".luarc.json", ".git" },
	filetypes = { "lua" },
}

